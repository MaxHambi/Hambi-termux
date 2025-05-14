#!/data/data/com.termux/files/usr/bin/bash

# Farben für Ausgabe
GREEN='\033[0;32m'
NC='\033[0m'

# Funktion zur Installation einzelner Tools
install_metasploit() {
  echo -e "${GREEN}[*] Installiere Metasploit...${NC}"
  pkg install -y git curl ruby python clang make ncurses-utils
  curl -LO https://raw.githubusercontent.com/gushmazuko/metasploit_in_termux/master/metasploit.sh
  chmod +x metasploit.sh
  ./metasploit.sh
}

install_nmap() {
  echo -e "${GREEN}[*] Installiere Nmap...${NC}"
  pkg install -y nmap
}

install_sqlmap() {
  echo -e "${GREEN}[*] Installiere sqlmap...${NC}"
  pkg install -y git python
  git clone https://github.com/sqlmapproject/sqlmap.git ~/sqlmap
}

install_hydra() {
  echo -e "${GREEN}[*] Installiere Abhängigkeiten für Hydra...${NC}"
  pkg install -y git build-essential clang make openssl-tool libcurl curl

  echo -e "${GREEN}[*] Klone Hydra-Quellcode...${NC}"
  git clone https://github.com/vanhauser-thc/thc-hydra.git ~/thc-hydra

  echo -e "${GREEN}[*] Kompiliere Hydra (kann ein paar Minuten dauern)...${NC}"
  cd ~/thc-hydra
  ./configure
  make

  echo -e "${GREEN}[+] Hydra ist installiert! Starte es mit:${NC} ~/thc-hydra/hydra"
}

install_nikto() {
  echo -e "${GREEN}[*] Installiere Nikto...${NC}"
  pkg install -y git perl
  git clone https://github.com/sullo/nikto.git ~/nikto
}

# Menü anzeigen
while true; do
  echo -e "\n${GREEN}== Termux Tool Installer ==${NC}"
  echo "1) Metasploit"
  echo "2) Nmap"
  echo "3) sqlmap"
  echo "4) Hydra"
  echo "5) Nikto"
  echo "6) Beenden"
  read -p "Wähle eine Option [1–6]: " auswahl

  case $auswahl in
    1) install_metasploit ;;
    2) install_nmap ;;
    3) install_sqlmap ;;
    4) install_hydra ;;
    5) install_nikto ;;
    6) echo "Beende..."; break ;;
    *) echo "Ungültige Eingabe." ;;
  esac
done
