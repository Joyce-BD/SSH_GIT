#!/bin/bash


# Copier le fichier de configuration sur le serveur

cp ./config__files/ssh/sshd_config /etc/ssh/sshd_config
cp ./config__files/ssh/Banner /etc/Banner

# Redemarrer le service sshd 
systemctl restart sshd 

# Creation d'un utilisateur Joyce
read -p "saisir le nom du nouveau utilisateur " username
useradd $username
# Integration de l'utilisateur Joyce dans le groupe Sudo
echo "Integration de l'utilisateur $username dans le groupe Sudo "
usermod -g admin $username
echo " fin d'Integration de l'utilisateur $username dans le groupe Sudo .......... "

# Configuration automatique du service SSHd
echo "Configuration automatique du service SSHd ......."
echo ./config__files/ssh/sshd_config > /etc/ssh/sshd_config
#Authorisation de se connecter sur le user X avec une clee ssh predefinie
# Redemarrer le service sshd 
echo "Redemarrage  du service sshd "
systemctl restart sshd 
read -p "Renseigner votre cle publique" P_key
echo " autorisation de connxion ssh de l'utilisateur $username encours ......"
echo $P_key >> ~/.ssh/authorized_keys
echo "connexion ssh autorisee pour  $username ......" 
