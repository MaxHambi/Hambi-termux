#!/data/data/com.termux/files/usr/bin/bash

# Backup-Ziel
BACKUP_DIR=~/termux-backup

# Wechsle ins Repo
cd $BACKUP_DIR || exit 1

# Paketliste speichern
pkg list-installed > termux-pkg-list.txt

# Konfigurationsdateien sichern
cp -f ~/.bashrc .bashrc
cp -f ~/.zshrc .zshrc
cp -rf ~/.termux .termux

# Alle eigenen Skripte sichern
mkdir -p scripts
cp -f ~/*.sh scripts/ 2>/dev/null

# Git-Commit & Push
git add .
git commit -m "Automatisches Termux-Backup vom $(date)"
git push
