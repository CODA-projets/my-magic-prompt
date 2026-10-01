#!/bin/bash
source quit.sh

## les variables : ##
prenom="Théo"
nom="Arcelin"
email="theo.arcelin23@gmail.com"
age="18"
version="1.0"

login="theo"
pass="1234"


cmd() {
  cmd=$1
  argv=$*

  case "${cmd}" in
    quit | exit ) quit;;
    help ) help_function;;
    ls ) ls -la;;
    rm ) rm $2;; 
    rmd | rmdir ) rmdir $2;; ## aider par Raphael 
    about ) about_function;; ## aider par Raphael
    version | --v | vers ) version_function;;
    age ) age_function;;
    profil ) profil_function;;
    cd ) cd_function $2;;
    pwd ) pwd_function;;
    hour ) hour_function $2;;
    httpget ) httpget_function $2;;
    clear ) clear_function;;
    smtp ) smtp_function $*;;
    open ) vim $1;;
    passw ) passw_function;;

    * ) echo "commande inconnue";;

  esac
}

help_function () {
  echo "Commandes disponibles :"
  echo "  help : Affiche l'aide"
  echo "  ls : Liste les fichiers et répertoires"
  echo "  rm : Supprime un fichier"
  echo "  rmd : Supprime un répertoire vide"
  echo "  about : Affiche des informations sur le prompt"
  echo "  version : Affiche la version du prompt"
  echo "  age : Vérifie si l'utilisateur est majeur ou mineur"
  echo "  profil : Affiche le profil de l'utilisateur"
  echo "  cd : Change le répertoire courant"
  echo "  pwd : Affiche le répertoire courant"
  echo "  hour : Affiche l'heure actuelle"
  echo "  httpget : Télécharge une page web et l'enregistre dans un fichier HTML"
  echo "  clear : Efface l'écran"
  echo "  smtp : Envoie un e-mail via SMTP"
  echo "  open : Ouvre un fichier avec vim"
}
version_function () {
  echo $version
}
about_function () {
  echo "le prompt est un shell en Bash avec des commandes de base."
}
age_function () {
  echo -n "entrez votre âge : "
  read -r age
  if [[ $age -ge 18 ]]; then
    echo "majeur"
  else
    echo "mineur"
  fi
}
profil_function () { 
  echo $nom "|" $prenom "|" $age "|" $email
}
cd_function () {
  cd $*
}
pwd_function () {
  pwd
}
hour_function () {
  date +%T
}
httpget_function () {
  read -p "Entrez le nom du fichier à télécharger : " filename
  read -p "Entrez l'URL du fichier à télécharger : " url
  curl $url -o $filename.html
}
clear_function () {
  clear
}
smtp_function () {
  read -p "Entrez l'adresse e-mail du destinataire : " adresse
  read -p "Entrez l'objet du message : " sujet
  read -p "Entrez le corps du message : " corps
}
login () { 
  echo "Bienvenue sur le prompt de Théo Arcelin"
  read -p "entrez votre nom d'utilisateur : " username
  read -sp "entrez votre mot de passe : " password
  if [[ $username == $login && $password == $pass ]]; then
    echo -e "\nConnexion réussie !"
  else
    echo -e "\nNom d'utilisateur ou mot de passe incorrect."
    quit
  fi

}
passw_function () {
  read -sp "Entrez votre mot de passe actuel : " current_password
  if [[ $current_password == $pass ]]; then
    read -sp "Entrez votre nouveau mot de passe : " new_password
    read -sp "Confirmez votre nouveau mot de passe : " confirm_password
    if [[ $new_password == $confirm_password ]]; then
      pass=$new_password
      echo -e "\nMot de passe modifié avec succès !"
    else
      echo -e "\nLes mots de passe ne correspondent pas. Le mot de passe n'a pas été modifié."
    fi
  else
    echo -e "\nMot de passe actuel incorrect. Le mot de passe n'a pas été modifié."
  fi
}


main() {
  
   login

  lineCount=1

 

  while [ 1 ]; do
    date=$(date +%H:%M)
    echo -ne "${date} - [\033[31m${lineCount}\033[m] - \033[33mThéo\033[m ~ 😽 ~ "
    read string

    cmd $string
    lineCount=$(($lineCount+1))
  done
}

main
