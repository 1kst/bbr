#!/bin/bash

# Run AdGuardHome installation script
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

# Run dnsmasq_sniproxy installation script
wget --no-check-certificate -O dnsmasq_sniproxy.sh https://raw.githubusercontent.com/myxuchangbin/dnsmasq_sniproxy_install/master/dnsmasq_sniproxy.sh
bash dnsmasq_sniproxy.sh --is

# Pull AdGuardHome.yaml from GitHub
wget -O /opt/AdGuardHome/AdGuardHome.yaml https://github.com/1kst/jiaoben/raw/main/sgjiesuo/AdGuardHome.yaml

# Log the output
log_file="/var/log/script_log.txt"
echo "Script started at $(date)" >> "$log_file"

# Log the output of AdGuardHome installation
echo "----- AdGuardHome Installation Output -----" >> "$log_file"
cat /opt/AdGuardHome/AdGuardHomeInstaller.log >> "$log_file"

# Log the output of dnsmasq_sniproxy installation
echo "----- dnsmasq_sniproxy Installation Output -----" >> "$log_file"
cat /var/log/dnsmasq_sniproxy_install.log >> "$log_file"

echo "Script finished at $(date)" >> "$log_file"
