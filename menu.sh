#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$y                  MENU UTAMA $wh"
echo -e "$y-------------------------------------------------$wh"
echo -e "$yy 1$y.  VMESS MENU$wh"
echo -e "$yy 2$y. TROJAN GFW MENU$wh"
echo -e "$yy 3$y. Exit$wh"
echo -e "$y-------------------------------------------------$wh"
read -p "Select From Options [ 1 - 3 ] : " menu
case $menu in
1)
clear
vmessmenu
;;
2)
clear
trmenu
;;
3)
clear
exit
;;
*)
clear
menu
;;
esac
