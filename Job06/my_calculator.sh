#!/bin/bash
operation == "+;-;*;/"
read -n1 -p "Quelle opération voulez-vous effectuer : [+]ddition [-]oustraction [*]ultiplication [/]ivision ?";

case $REPLY in

"+")
read -p "Entrez le premier nombre : " num1
read -p "Entrez le deuxième nombre : " num2
result=$(($num1 + $num2))
echo "Résultat de l'addition : $result"
;;
"-")
read -p "Entrez le premier nombre : " num1
read -p "Entrez le deuxième nombre : " num2
result=$(($num1 - $num2))
echo "Résultat de la soustraction : $result"
;;
"*")
read -p "Entrez le premier nombre : " num1
read -p "Entrez le deuxième nombre : " num2
result=$(($num1 * $num2))
echo "Résultat de la multiplication : $result"
;;
"/")
read -p "Entrez le numérateur : " num1
read -p "Entrez le dénominateur : " num2
if [ $num2 -eq 0 ]; then
    echo "Erreur : Division par zéro."
else
 result=$(echo "scale=2; $num1 / $num2" | bc)
    echo "Résultat de la division : $result"
fi
;;

 *)
        echo "Opération : \"$operation\" non reconnue."
        ;;
esac
