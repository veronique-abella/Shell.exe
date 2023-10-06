#!/bin/bash
sed '1d' Shell_Userlist.csv > Shell_Userlist2.csv

while IFS=',' read -r id prenom nom mdp role; do
nom_utilisateur=$(echo "$prenom $nom")

  if [ -d "/home/$nom_utilisateur" ]; then
	if [ "$role" = "Admin" ]; then
	sudo usermod -aG sudo "$nom_utilisateur"
	else
	sudo usermod -G users "$nom_utilisateur"
	fi
    echo "L'utilisateur $nom_utilisateur existe déjà. Ignoré."
  else
   sudo useradd "$nom_utilisateur" --badname --uid "$id" --create-home
   echo "$nom_utilisateur:$mdp" | sudo chpasswd
	if [ "$role" = "Admin" ]; then
	sudo usermod -aG sudo "$nom_utilisateur"
   	fi
  fi
done < Shell_Userlist2.csv

rm Shell_Userlist2.csv
echo "Toutes les opérations sont terminées."
