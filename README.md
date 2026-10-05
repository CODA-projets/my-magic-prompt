# My Magic Prompt

Un mini shell en Bash avec des commandes maison, protégé par un login.

## Lancement

```bash
cp .env.example .env   # puis remplissez LOGIN et PASSWORD
./main.sh
```

Prérequis : Bash (Linux, macOS ou Git Bash sous Windows) et `curl`.

Au démarrage, le prompt demande un identifiant et un mot de passe (ceux définis dans `.env`).

## Commandes

| Commande | Description |
|---|---|
| `help` | Affiche l'aide |
| `about` | Informations sur le prompt |
| `version` | Affiche la version (`--v`, `vers` fonctionnent aussi) |
| `profil` | Affiche le profil de l'utilisateur |
| `age` | Indique si l'utilisateur est majeur ou mineur |
| `hour` | Affiche l'heure actuelle |
| `httpget` | Télécharge une page web dans un fichier HTML |
| `smtp` | Envoie un e-mail via SMTP |
| `passw` | Change le mot de passe |
| `open` | Ouvre un fichier avec vim |
| `rmd` | Supprime un répertoire vide |
| `clear` | Efface l'écran |
| `joke` | Affiche une blague |
| `bonjour` | Affiche un message de bienvenue |
| `quit` / `exit` | Quitte le prompt |

## Structure

```
main.sh        # Point d'entrée : login, dispatcher des commandes
commands/      # Une fonction par fichier, sourcées par main.sh
quit.sh        # Fonction quit
.env           # Identifiants (non versionné)
```

Pour ajouter une commande : créez `commands/ma_commande.sh` avec votre fonction, sourcez-le dans `main.sh` et ajoutez-la au `case` de `cmd()`.
