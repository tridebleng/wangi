#!/bin/bash
BICyan='\033[1;96m'       # Cyan
red='\e[1;31m'
green='\e[1;32m'

cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
rekk='xray'
becek='XRAY'
else
rekk='v2ray'
becek='V2RAY'
fi

ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ONLINE${NC}"
else
ressh="${red}OFFLINE${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ONLINE${NC}"
else
resst="${red}OFFLINE${NC}"
fi
sshws=$(service ws-dropbear status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
rews="${green}ONLINE${NC}"
else
rews="${red}OFFLINE${NC}"
fi

sshws2=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws2" = "active" ]; then
rews2="${green}ONLINE${NC}"
else
rews2="${red}OFFLINE${NC}"
fi

db=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$db" = "active" ]; then
resdb="${green}ONLINE${NC}"
else
resdb="${red}OFFLINE${NC}"
fi
 
v2r=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ONLINE${NC}"
else
resv2r="${red}OFFLINE${NC}"
fi
vles=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$vles" = "active" ]; then
resvles="${green}ONLINE${NC}"
else
resvles="${red}OFFLINE${NC}"
fi
trj=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$trj" = "active" ]; then
restr="${green}ONLINE${NC}"
else
restr="${red}OFFLINE${NC}"
fi

ningx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ningx" = "active" ]; then
resnx="${green}ONLINE${NC}"
else
resnx="${red}OFFLINE${NC}"
fi

squid=$(service squid status | grep active | cut -d ' ' $stat)
if [ "$squid" = "active" ]; then
ressq="${green}ONLINE${NC}"
else
ressq="${red}OFFLINE${NC}"
fi
echo -e "${BICyan}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}│${NC} ${COLBG1}               • SERVER STATUS •               ${NC} ${BICyan}│$NC"
echo -e "${BICyan}└─────────────────────────────────────────────────┘${NC}"
echo -e " ${BICyan}┌───────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│${NC}  • SSH & VPN                        • $ressh"
echo -e " ${BICyan}│${NC}  • SQUID                            • $ressq"
echo -e " ${BICyan}│${NC}  • DROPBEAR                         • $resdb"
echo -e " ${BICyan}│${NC}  • NGINX                            • $resnx"
echo -e " ${BICyan}│${NC}  • WS DROPBEAR                      • $rews"
echo -e " ${BICyan}│${NC}  • WS STUNNEL                       • $rews2"
echo -e " ${BICyan}│${NC}  • STUNNEL                          • $resst"
echo -e " ${BICyan}│${NC}  • XRAY-SS                          • $resv2r"
echo -e " ${BICyan}│${NC}  • XRAY                             • $resv2r"
echo -e " ${BICyan}│${NC}  • VLESS                            • $resvles"
echo -e " ${BICyan}│${NC}  • TROJAN                           • $restr"
echo -e " ${BICyan}└───────────────────────────────────────────────┘${NC}" 
echo -e "${BICyan}┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "${BICyan}│${NC}           ${green}     • ARTA MAULANA •       $NC          ${BICyan}│$NC"
echo -e "${BICyan}└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu