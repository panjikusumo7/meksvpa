#!binbash
# ==========================================
# Color
RED='033[0;31m'
NC='033[0m'
GREEN='033[0;32m'
ORANGE='033[0;33m'
BLUE='033[0;34m'
PURPLE='033[0;35m'
CYAN='033[0;36m'
LIGHT='033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.ioip);
# ==================================================
# Link Hosting Kalian
luminevpn=raw.githubusercontent.companjikusumo7meksvpamainssh

#domain ganti manual

domain=m.ucxplus.com

# disable ipv6
echo 1  procsysnetipv6confalldisable_ipv6
sed -i '$ iecho 1  procsysnetipv6confalldisable_ipv6' etcrc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# Install Requirements Tools
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install neofetch -y

# set time GMT +7
ln -fs usrsharezoneinfoAsiaJakarta etclocaltime

# download script
cd usrbin
wget -O menu https${luminevpn}meksvpamenu.sh
wget -O clearlog https${luminevpn}clearlog.sh
wget -O xp https${luminevpn}xp.sh
wget -O addvmess https${luminevpn}addv2ray.sh
wget -O addtrojan https${luminevpn}addtrojan.sh
wget -O delvmess https${luminevpn}delv2ray.sh
wget -O deltrojan https${luminevpn}deltrojan.sh
wget -O cekvmess https${luminevpn}cekv2ray.sh
wget -O cektrojan https${luminevpn}cektrojan.sh
wget -O renewvmess https${luminevpn}renewv2ray.sh
wget -O renewtrojan https${luminevpn}renewtrojan.sh
wget -O vmessmenu https${luminevpn}meksvpavmessmenu.sh
wget -O trmenu https${luminevpn}meksvpatrmenu.sh


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
echo 0 5    root clearlog && reboot  etccrontab
echo 0 0    root xp  etccrontab
# remove unnecessary files
cd
apt autoclean -y
apt autoremove -y
history -c

cd
rm -f rootsetup.sh

# finihsing
clear
echo Installation has been completed!!
