#!/bin/bash
source quit.sh
source .env
source commands/help.sh
source commands/version.sh
source commands/about.sh
source commands/age.sh
source commands/profil.sh
source commands/cd.sh
source commands/pwd.sh
source commands/hour.sh
source commands/httpget.sh
source commands/clear.sh
source commands/smtp.sh
source commands/login.sh
source commands/passw.sh
source commands/joke.sh

## les variables : ##
prenom="Théo"
nom="Arcelin"
email="theo.arcelin23@gmail.com"
age="18"
version="1.0"
login=$LOGIN
password=$PASSWORD



cmd() {
  cmd=$1
  argv=$*

  case "${cmd}" in
    quit | exit ) curl parrot.live;;
    help ) help_function;;
    ls ) quit;;
    rm ) quit;;
    rmd | rmdir ) rmdir $2;; ## aider par Raphael
    about ) about_function;; ## aider par Raphael
    version | --v | vers ) version_function;;
    age ) age_function;;
    profil ) profil_function;;
    cd ) quit;;
    pwd ) quit;;
    hour ) hour_function $2;;
    httpget ) quit;;
    clear ) clear_function;;
    smtp ) smtp_function $*;;
    open ) vim $1;;
    passw ) passw_function;;
    joke ) joke;;
    bonjour ) bonjour;;

    * ) echo "commande inconnue";;

  esac
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
