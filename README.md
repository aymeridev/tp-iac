# tp-iac

9) un montage bind relie un fichier/dossier à un autre. cela permet de ne pas avoir a copier les fichiers à chaque modification, ou a pouvoir les modifier depuis l'image Docker

10)

- le conteneur est connecté car on l'a déclaré dans le main.tf.
- cela permet au conteneur d'accéder à nginx/docker, sinon il n'y aurait pas accès.

11) cela permet de limiter le terraform a une seule ip, par exemple sur un serveur cela empêche a des utilisateurs tiers d'y accéder et de faire des requêtes

13)
- le site web, nginx et le réseau docker.
- les informations du conteneur (ses paramètres, son réseau, ses points de montage, etc..)
- car cela peut contenir des informations sensibles
- pour ne pas divulguer sur un dépot public les informations de connexion à la bdd, clés privés, etc...

15) cela permet de facilement basculer d'une version à la précedente, de consulter le travail de ses collègues, etc...

---

exo 1 : dans dev.tfvars, on change `container_name`

exo 2 : pareil dans dev.tfvars, on change `external_port`

exo 4 : terraform state list affiche 3 ressources (image, réseau, conteneur). Le conteneur dépend de l'image (image_id) et du réseau (networks_advanced). Ce sont des dépendances implicites

exo 5 : après un docker stop, terraform plan détecte une dérive. Le refresh constate que le conteneur ne tourne plus, alors que must_run = true, et propose de le recréer. avec terraform apply cela restaure l'état