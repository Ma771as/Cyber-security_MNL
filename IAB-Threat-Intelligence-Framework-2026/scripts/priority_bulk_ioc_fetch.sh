#!/bin/bash

# Automate the secuential running of fetch_iocs.py with multiple keywords
# Define the list of IOCs argvs
IOC_LIST=("RDP access" "Initial Access Broker" "RedLine Stealer" "Oakbot" "SCADA" "Critical Infrastructure" "Valid Accounts" "Exploit Public-Facing Application" "Browser Credential Theft" "AnyDesk" "ScreenConnect" "LSASS dump" "PsExec" "AdFind" "curl OR wget" "ProxyShell")



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
