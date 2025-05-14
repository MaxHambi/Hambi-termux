#!/data/data/com.termux/files/usr/bin/bash

# Farben für Ausgabe
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[*] Aktualisiere Pakete...${NC}"
pkg update -y && pkg upgrade -y

echo -e "${GREEN}[*] Installiere Abhängigkeiten...${NC}"
pkg install -y git curl wget ruby python clang make ncurses-utils

echo -e "${GREEN}[*] Lade Metasploit-Installationsskript herunter...${NC}"
curl -LO https://raw.githubusercontent.com/gushmazuko/metasploit_in_termux/master/metasploit.sh

echo -e "${GREEN}[*] Setze Berechtigungen...${NC}"
chmod +x metasploit.sh

echo -e "${GREEN}[*] Starte Metasploit-Installation...${NC}"
./metasploit.sh

echo -e "${GREEN}[+] Installation abgeschlossen. Starte Metasploit mit:${NC} cd ~/metasploit-framework && ./msfconsole"
