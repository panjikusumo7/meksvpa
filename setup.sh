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
# ==================================================
# Link Hosting Kalian
luminevpn="raw.githubusercontent.com/panjikusumo7/meksvpa"

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# Install Requirements Tools
apt install ruby -y
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
apt install libssl1.0-dev -y
apt install dos2unix -y

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch" >> .profile

# download script
cd /usr/bin
wget -O menu "https://${luminevpn}/menu.sh"
wget -O clearlog "https://${luminevpn}/clearlog.sh"
wget -O xp "https://${luminevpn}/xp.sh"
wget -O addvmess "https://${luminevpn}/addv2ray.sh"
wget -O addtrojan "https://${luminevpn}/addtrojan.sh"
wget -O delvmess "https://${luminevpn}/delv2ray.sh"
wget -O deltrojan "https://${luminevpn}/deltrojan.sh"
wget -O cekvmess "https://${luminevpn}/cekv2ray.sh"
wget -O cektrojan "https://${luminevpn}/cektrojan.sh"
wget -O renewvmess "https://${luminevpn}/renewv2ray.sh"
wget -O renewtrojan "https://${luminevpn}/renewtrojan.sh"
wget -O vmessmenu "https://${luminevpn}/vmessmenu.sh" 
wget -O trmenu "https://${luminevpn}/trmenu.sh"


chmod +x vmessmenu
chmod +x trmenu
chmod +x menu
chmod +x clearlog
chmod +x xp
chmod +x addvmess
chmod +x addtrojan
chmod +x delvmess
chmod +x deltrojan
chmod +x cekvmess
chmod +x cektrojan
chmod +x renewvmess
chmod +x renewtrojan
echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
history -c

cd
rm -f /root/setup.sh

# finihsing
clear

echo "Installation has been completed!!"
