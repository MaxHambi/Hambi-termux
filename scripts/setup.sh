#!/data/data/com.termux/files/usr/bin/bash

# Grundlegende System-Updates
pkg update -y && pkg upgrade -y

# Wichtige Tools installieren
pkg install -y git curl wget vim nano htop unzip zip tar \
  openssh python ruby nodejs clang make ncurses-utils \
  proot termux-api

# Python-Pip und wichtige Module
pip install --upgrade pip
pip install requests flask

# Termux-Konfiguration anpassen (Farben, Aliase, etc.)
echo "
# Benutzerdefinierte .bashrc
alias ll='ls -alh --color=auto'
alias update='pkg update -y && pkg upgrade -y'
PS1='\033[1;32m\u@\h:\w \$\033[0m '
" >> ~/.bashrc

# Standardverzeichnisse erstellen
mkdir -p ~/tools ~/projects ~/downloads

# Abschluss
echo -e '\nTermux ist nun vorbereitet. Starte es neu mit: exit\n'


---
