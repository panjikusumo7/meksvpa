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
data=( `cat /etc/v2ray-agent/xray/conf/04_trojan_TCP_inbounds.json | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#&# $user" "/etc/v2ray-agent/xray/conf/04_trojan_TCP_inbounds.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#&# $user $exp/,/^},{/d" /etc/v2ray-agent/xray/conf/04_trojan_TCP_inbounds.json
fi
done
systemctl restart xray.service
data=( `cat /etc/v2ray-agent/xray/conf/05_VMess_WS_inbounds.json | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/v2ray-agent/xray/conf/05_VMess_WS_inbounds.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray-agent/xray/conf/05_VMess_WS_inbounds.json
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray-agent/xray/conf/05_VMess_WS_inbounds.json
rm -f /etc/v2ray-agent/xray/conf/vmess-$user-tls.json /etc/v2ray-agent/xray/conf/vmess-$user-cdn.json
fi
done
systemctl restart xray.service