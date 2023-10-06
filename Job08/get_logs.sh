#!/bin/bash
nombre_de_connexion=$(last | grep "vero" | wc -l)
date=$(date +%d-%m-%Y-%H-%M)

echo "Nombre de connexion de vero : $nombre_de_connexion" > number_connection-$date
tar -cf "archive.tar" "number_connection-$date"
mv archive.tar number_connection-$date.tar 
mv number_connection-$date.tar Backup/ 




