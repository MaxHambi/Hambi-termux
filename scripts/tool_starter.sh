#!/data/data/com.termux/files/usr/bin/bash

# Farben
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Pfad zur Datei
SCRIPT_PATH="$HOME/tool_starter.sh"

# Lade benutzerdefinierte Tools (ab Marker)
user_tools=()
while IFS="|" read -r name cmd; do
  if [[ -n "$name" && -n "$cmd" ]]; then
    user_tools+=("$name|$cmd")
  fi
done < <(grep -A 1000 "^# === Benutzerdefinierte Tools ===" "$SCRIPT_PATH" | tail -n +2)

# Menü anzeigen
while true; do
  echo -e "\n${GREEN}== Tool-Starter-Menü ==${NC}"
  echo "1) Starte Hydra"
  echo "2) Starte Metasploit"
  echo "3) Starte Nmap"

  # Benutzerdefinierte Tools anzeigen ab Menüpunkt 4
  offset=4
  for i in "${!user_tools[@]}"; do
    name=$(echo "${user_tools[$i]}" | cut -d'|' -f1)
    echo "$((i + offset))) Starte $name"
  done

  # Menü-Optionen hinzufügen & beenden – immer zuletzt
  echo "$((offset + ${#user_tools[@]}))) Eigenes Tool hinzufügen"
  echo "$((offset + ${#user_tools[@]} + 1))) Beenden"

  # Eingabe abfragen
  read -p "Wähle ein Tool: " auswahl

  if [[ "$auswahl" == "1" ]]; then
    cd ~/thc-hydra && ./hydra
  elif [[ "$auswahl" == "2" ]]; then
    cd ~/metasploit-framework && ./msfconsole
  elif [[ "$auswahl" == "3" ]]; then
    nmap
  elif (( auswahl >= offset && auswahl < offset + ${#user_tools[@]} )); then
    index=$((auswahl - offset))
    cmd=$(echo "${user_tools[$index]}" | cut -d'|' -f2)
    echo -e "${GREEN}[*] Starte $(echo "${user_tools[$index]}" | cut -d'|' -f1)...${NC}"
    eval "$cmd"
  elif (( auswahl == offset + ${#user_tools[@]} )); then
    # Eigenes Tool hinzufügen
    echo -e "${GREEN}Neues Tool hinzufügen${NC}"
    read -p "Name des Tools: " toolname
    read -p "Befehl zum Starten: " toolcmd
    if [[ -n "$toolname" && -n "$toolcmd" ]]; then
      sed -i "/^# === Benutzerdefinierte Tools ===/a $toolname|$toolcmd" "$SCRIPT_PATH"
      echo -e "${GREEN}[+] Tool hinzugefügt. Starte Menü neu...${NC}"
      exec bash "$SCRIPT_PATH"
    else
      echo -e "${RED}[!] Ungültige Eingabe.${NC}"
    fi
  elif (( auswahl == offset + ${#user_tools[@]} + 1 )); then
    echo -e "${GREEN}Beende...${NC}"
    break
  else
    echo -e "${RED}[!] Ungültige Auswahl.${NC}"
  fi
done

# === Benutzerdefinierte Tools ===
Backup 2 Github|./backup.sh
ZSHrc Edit|./zshrc_tool.sh

