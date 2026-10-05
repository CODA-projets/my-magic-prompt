age_function () {
  echo -n "entrez votre âge : "
  read -r age
  if [[ $age -ge 18 ]]; then
    echo "majeur"
  else
    echo "mineur"
  fi
}
