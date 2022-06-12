#!/bin/bash
# ==========================================
# Colorl
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
source /var/lib/lumine/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /var/lib/lumine/domain)
else
domain=$IP
fi
tr="443"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/v2ray-agent/xray/conf/04_trojan_TCP_inbounds.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-trojan$/a\### '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/v2ray-agent/xray/conf/04_trojan_TCP_inbounds.json
systemctl restart xray.service
trojanlink="trojan://${user}@${domain}:${tr}?allowInsecure=1&sni=mobile.youtube.com&alpn=h2#${user}_TROJAN-GFW"
service cron restart
clear
echo -e ""
echo -e "======-XRAY Trojan Account-======"
echo -e "Username : ${user}"
echo -e "IP  	  : ${MYIP}"
echo -e "Hostname : ${domain}"
echo -e "Port     : ${tr}"
echo -e "Password : ${user}"
echo -e "Created  : $hariini"
echo -e "Tanggal Expired  : $exp"
echo -e ${nwln}
echo -e "Link Trojan-GFW  : ${trojanlink}"
echo -e ${nwln}
echo -e "================================"
echo -e "Perpanjang 3 hari sebelum expired"
echo -e "Chat Support wa.me/+62812xxxxxxx"
echo -e "================================"