# sys mod allows access to system-specific parameters and func like CLI arg
import sys
import requests
import csv
from datetime import datetime
from dotenv import load_dotenv
import os

load_dotenv('key.env')
API_KEY = os.getenv("OTX_API_KEY")
OTX_BASE_URL = "https://otx.alienvault.com/api/v1/search/pulses/"


def normalize_ioc(ioc_raw, pulse_id):

    tags_list = ioc_raw.get('tags', [])
    tags_string = ", ".join(tags_list)

    current_time = datetime.now().isoformat()

    # Normalization: Func take one IOC dict and returns a clean, normalized dict
    normalized_record = {
        "collected_at": current_time,
        "source": "AlienVault OTX",
        "pulse_id": pulse_id,
        "ioc_type": ioc_raw.get('type'),
        "ioc_value": ioc_raw.get('indicator'),
        "description": ioc_raw.get('description', 'No description provided'),
        "tags": tags_string,
        "raw_json_link": f"{OTX_BASE_URL}",
    }
    return normalized_record

def main():
    print("Threat Intel IOC Fetcher - Running the collection Phase.")

    # Checks: CLI arg provided after command
    keyword = None
    if len(sys.argv) > 1:
        keyword = sys.argv[1]
        # if True return keyword, else "using default"
        print(f"Keyword supplied: {keyword}")
    else:
        keyword = "malware"
        print("No search keyword provided. Using default")

    # --- API Autentication and Params ---
    headers = {
        'X-OTX-API-KEY': API_KEY
    }
    params = {
        'q': keyword,
        'limit': 50
    }

# --- API Collection ---
    print(f"\nQuerying OTX Search URL with Keyword: '{keyword}'")
    try:
        # request.get() sends and HTTP GET request to the URL
        response = requests.get(OTX_BASE_URL, headers=headers, params=params)

        # Error Handling: .raise_for_status() checks if the HTTP REQ was successful
        # -- If it returns 4xx or 5xx error code, it raises and exception
        response.raise_for_status()

        # Parsing: .json() parses the raw text of the HTTP response, and convet it in a native python dict
        api_data_dict = response.json()

        print("\n[SUCCESS] API data retrieved and converted to Python dictionary.")

        # --- Data Processiog / Normalization ---
        pulse_results_list = api_data_dict.get('results', [])
        all_normalized_iocs = []
        total_ioc_count = 0

        # Loop through each PULSE returned by the search result
        for pulse in pulse_results_list:
            pulse_id = pulse.get('id', 'N/A')

            ioc_indicators_list = pulse.get('indicators', [])


            print(f" -> Processing Pulse ID {pulse_id} with {len(ioc_indicators_list)} indicators.")

            for raw_ioc in ioc_indicators_list:
                clean_record = normalize_ioc(raw_ioc, pulse_id)
                all_normalized_iocs.append(clean_record)
                total_ioc_count += 1


        print(f"[SUCCESS] Normalized a total of {total_ioc_count} IOCs from {len(pulse_results_list)} pulses.")

        # --- Dissemination / CSV Writing ---
        if all_normalized_iocs:
            fieldnames = ['collected_at', 'source', 'pulse_id', 'ioc_type', 'ioc_value', 'description', 'tags', 'raw_json_link']
            output_file = f'collected_iocs_{keyword}.csv'

            # with open(...) ensures the file is always closed even if error occur
            with open(output_file, 'w', newline='', encoding='utf-8') as csvfile:
                writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

                writer.writeheader()
                writer.writerows(all_normalized_iocs)

            print(f"[SUCCESS] Wrote {total_ioc_count} records to {output_file}")

    # Error Handling: any HTTP or network realated error makes you safely exit the script upon failure
    except requests.exceptions.RequestException as e:
        print(f"[ERROR] Could not fetch data from API: {e}")
        print("\nNote: A 401 error means your API key is invalid or missing. A 404 or 403 means the resource is not found or forbidden.")
        sys.exit(1)




if __name__ == "__main__":
    main()
    

