login () {
  echo "Bienvenue sur le prompt de Théo Arcelin"
  read -p "entrez votre nom d'utilisateur : " username
  read -sp "entrez votre mot de passe : " password
  if [[ $username == $login && $password == $PASSWORD ]]; then
    echo -e "\nConnexion réussie !"
  else
    echo -e "\nNom d'utilisateur ou mot de passe incorrect."
    quit
  fi

}
