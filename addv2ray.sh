#!/bin/bash
# ==========================================
# Color
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
clear
domain=$(cat /var/lib/lumine/domain)
tls="443"
nwln="\n"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
            read -rp "Username : " -e user
            CLIENT_EXISTS=$(grep -w $user /root/v2ray/config.json | wc -l)

            if [[ ${CLIENT_EXISTS} == '1' ]]; then
                  echo ""
                  echo -e "Username ${RED}${CLIENT_NAME}${NC} Already On VPS Please Choose Another"
                  exit 1
            fi
      done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vmess-tls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'"' /root/v2ray/config.json
cat>/root/v2ray/vmess-$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/luminemyid",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
cat>/root/v2ray/vmess-$user-cdn.json<<EOF
      {"v":"2","ps":"${user}","add":"www.digitalocean.com","aid":"0","port":"443","type":"none","net":"ws","path":"/luminemyid","host":"${domain}","id":"${uuid}","tls":"tls"}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
xrayv2ray1="vmess://$(base64 -w 0 /root/v2ray/vmess-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /root/v2ray/vmess-$user-cdn.json)"
rm -rf /root/v2ray/vmess-$user-tls.json
rm -rf /root/v2ray/vmess-$user-cdn.json
systemctl restart xray.service
service cron restart
clear
echo -e ""
echo -e "======-XRAY Vmess Account-======"
echo -e "Remarks     : ${user}"
echo -e "IP/Host     : ${MYIP}"
echo -e "Address     : ${domain}"
echo -e "Port TLS    : ${tls}"
echo -e "User ID     : ${uuid}"
echo -e "Alter ID    : 0"
echo -e "Security    : auto"
echo -e "Network     : ws"
echo -e "Path        : /luminemyid"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e ${nwln}
echo -e "VMESS TLS 443"
echo -e "${xrayv2ray1}"
echo -e ${nwln}
echo -e "VMESS CDN 443"
echo -e "${xrayv2ray2}"
echo -e ${nwln}
echo -e "================================"
echo -e "Perpanjang 3 hari sebelum expired"
echo -e "Chat Support wa.me/+62812xxxxxxx"
echo -e "================================"
