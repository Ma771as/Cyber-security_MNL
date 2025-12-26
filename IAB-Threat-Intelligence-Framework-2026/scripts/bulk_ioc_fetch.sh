#!/bin/bash

# Automate the secuential running of fetch_iocs.py with multiple keywords
# Define the list of IOCs argvs
IOC_LIST=("Ivanti" "ScreenConnect" "Fortinet" "ConnectWise" "Pulse Secure" "CVE-2024" "Zero-day exploit" "VPN access" "Active Directory" "Web shell" "Vidar Stealer" "LummaC2" "SmokeLoader" "ICS" "OPC" "Modbus" "Critical Infrastructure")



echo "Starting bulk IOC collection..."
echo "--------------------------------------"

# Iterate trough the list using a for-loop
for ioc in "${IOC_LIST[@]}"; do
	echo "Processing argument; $ioc"

	python3 fetch-iocs.py "$ioc"
	sleep 2

	echo "--- Done with $ioc ---"
done

echo "-------------------------------------"
echo "Bulk IOC collection complete."
