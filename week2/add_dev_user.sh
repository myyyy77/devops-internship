#!/bin/bash

# Verificăm dacă scriptul este rulat ca root (sudo)
if [ "$EUID" -ne 0 ]; then
  echo "Te rog rulează cu sudo: sudo $0 nume_utilizator"
  exit 1
fi

# Verificăm dacă am primit numele utilizatorului
if [ -z "$1" ]; then
  echo "Utilizare: $0 nume_utilizator"
  exit 1
fi

USER_NAME=$1

# 1. Crearea utilizatorului cu folder Home și shell Bash
useradd -m -s /bin/bash "$USER_NAME"
echo "Utilizatorul $USER_NAME a fost creat."

# 2. Crearea unui folder de proiecte în Home-ul lui
mkdir -p "/home/$USER_NAME/projects"
chown "$USER_NAME:$USER_NAME" "/home/$USER_NAME/projects"
echo "Folderul /home/$USER_NAME/projects a fost creat."

# 3. Adăugarea unui alias personalizat în .bashrc
echo "alias ll='ls -la'" >> "/home/$USER_NAME/.bashrc"
echo "Alias 'll' adăugat pentru $USER_NAME."

echo "Onboarding finalizat cu succes pentru $USER_NAME!"
