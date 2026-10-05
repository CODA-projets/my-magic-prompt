passw_function () {
  read -sp "Entrez votre mot de passe actuel : " current_password
  if [[ $current_password == $PASSWORD ]]; then
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
