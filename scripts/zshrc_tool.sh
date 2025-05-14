#!/data/data/com.termux/files/usr/bin/zsh

ZSHRC="$HOME/.zshrc"

function add_alias() {
    echo -n "Gib den Befehl ein, der ausgeführt werden soll: "
    read cmd
    echo -n "Wie soll der Alias heißen? "
    read alias_name
    echo "alias $alias_name='$cmd'" >> "$ZSHRC"
    echo "Alias hinzugefügt: $alias_name -> $cmd"
}

function edit_plugins() {
    current_plugins=$(grep "^plugins=" "$ZSHRC" | sed -E 's/plugins=(.*)/\1/')
    echo "Aktuelle Plugins: $current_plugins"
    echo -n "Möchtest du die Plugin-Liste bearbeiten? (j/n): "
    read choice
    if [[ "$choice" == "j" ]]; then
        echo -n "Gib die neue Plugin-Liste ein (z.B. git zsh-autosuggestions): "
        read new_plugins
        sed -i -E "s/^plugins=.*/plugins=($new_plugins)/" "$ZSHRC"
        echo "Plugins aktualisiert."
    fi
}

function edit_theme() {
    current_theme=$(grep "^ZSH_THEME=" "$ZSHRC" | sed -E 's/ZSH_THEME="(.*)"/\1/')
    echo "Aktuelles Theme: $current_theme"
    echo -n "Möchtest du das Theme ändern? (j/n): "
    read choice
    if [[ "$choice" == "j" ]]; then
        echo -n "Gib den Namen des neuen Themes ein: "
        read new_theme
        sed -i -E "s/^ZSH_THEME=\".*\"/ZSH_THEME=\"$new_theme\"/" "$ZSHRC"
        sed -i -E "s/POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true/POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=false/" "$ZSHRC"
        echo "Theme aktualisiert. Starte Einrichtungsskript..."
        omz theme configure
    fi
}

function main_menu() {
    echo "Was möchtest du tun?"
    echo "1 = Alias hinzufügen"
    echo "2 = Plugins bearbeiten"
    echo "3 = Theme bearbeiten"
    echo -n "Auswahl: "
    read option

    case "$option" in
        1) add_alias ;;
        2) edit_plugins ;;
        3) edit_theme ;;
        *) echo "Ungültige Auswahl" ;;
    esac

    echo "ZSH-Konfiguration neu laden..."
    source "$ZSHRC"
    echo "Fertig!"
}

main_menu
