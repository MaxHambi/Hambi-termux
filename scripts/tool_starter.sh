#!/data/data/com.termux/files/usr/bin/bash

# Farben
GREEN='\033[0;32m'
NC='\033[0m'

# Menü
while true; do
  echo -e "\n${GREEN}== Tool-Starter-Menü ==${NC}"
  echo "1) Starte Hydra"
  echo "2) Starte Metasploit"
  echo "3) Starte Nmap"
  echo "4) Beenden"
  read -p "Wähle ein Tool [1–4]: " auswahl

  case $auswahl in
    1)
      if [ -f "$HOME/thc-hydra/hydra" ]; then
        echo -e "${GREEN}[*] Starte Hydra...${NC}"
        cd ~/thc-hydra
        ./hydra
      else
        echo -e "${RED}[!] Hydra ist nicht installiert.${NC}"
      fi
      ;;
    2)
      if [ -f "$HOME/metasploit-framework/msfconsole" ]; then
        echo -e "${GREEN}[*] Starte Metasploit...${NC}"
        cd ~/metasploit-framework
        ./msfconsole
      else
        echo -e "${RED}[!] Metasploit ist nicht installiert.${NC}"
      fi
      ;;
    3)
      echo -e "${GREEN}[*] Starte Nmap...${NC}"
      nmap
      ;;
    4)
      echo -e "${GREEN}Beende...${NC}"
      break
      ;;
    *)
      echo -e "${RED}[!] Ungültige Eingabe.${NC}"
      ;;
  esac
done
