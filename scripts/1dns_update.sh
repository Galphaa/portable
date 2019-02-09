#!/bin/bash 

hostname=$1
ip_address=$2
last_octet=$3
FQDN=""$1".galpha.ga."
revers_ip=/etc/named/db.192.168.0
domain_area=/etc/named/galpha.ga
root_pass=
sshpass -p "$root_pass" ssh -o StrictHostKeyChecking=no -q root@dns bash -sx <<EOL
ch=\$(grep -wi -e $last_octet -e $FQDN $revers_ip | wc -l | grep -i 0)
if [[ \$ch == 0 ]]; then
sed -i "$ i\\$last_octet              IN      PTR     $FQDN" $revers_ip
else 
echo "ERROR REVERS_IP MAY BE SAME ADDRESS" 
fi
ch1=\$(grep -wi -e $ip_address -e $FQDN $domain_area | wc -l | grep -i 0)
if [[ \$ch1 == 0 ]]; then
sed -i "$ i\\$FQDN              IN      A       $ip_address" $domain_area
else 
echo "ERRPR DOMAIN_AREA MAY BE SAME ADDRESS"
fi
service named reload 
EOL
