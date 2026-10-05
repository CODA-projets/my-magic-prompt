httpget_function () {
  read -p "Entrez le nom du fichier à télécharger : " filename
  read -p "Entrez l'URL du fichier à télécharger : " url
  curl $url -o $filename.html
}
