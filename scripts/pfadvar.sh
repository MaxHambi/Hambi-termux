#!/data/data/com.termux/files/usr/bin/zsh

echo "📁 Neuen Pfad als Variable speichern"

# 1. Variablennamen eingeben
read "varname?🔤 Wie soll die Variable heißen (z.B. PROJEKT): "
# Nur Großbuchstaben und keine Leerzeichen zulassen
if [[ ! "$varname" =~ ^[A-Z_][A-Z0-9_]*$ ]]; then
  echo "❌ Ungültiger Variablenname. Nur GROSSBUCHSTABEN und _ erlaubt."
  exit 1
fi

# 2. Pfad eingeben
read "varpath?📂 Welcher Pfad soll gespeichert werden: "
if [ ! -d "$varpath" ]; then
  echo "❌ Pfad existiert nicht: $varpath"
  exit 1
fi

# 3. In .zshrc schreiben
echo "export $varname=\"$varpath\"" >> ~/.zshrc

# 4. .zshrc neu laden
source ~/.zshrc

echo "✅ Variable $varname wurde gesetzt auf: $varpath"
echo "💡 Jetzt kannst du z.B. mit: cd \$$varname direkt in den Ordner wechseln!"
