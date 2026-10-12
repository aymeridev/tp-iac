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

exo 7 : terraform destroy affiche les 3 resources qui vont être supprimés. il ne faut pas supprimer l'état terraform car c'est lui qui relie le code aux vrais resources (nginx/docker/web). sans le fichier, destroy ne marchera plu car terraform ne saura pas de quels ressources on parle.


---

1.  - init pour préparer le projet et configurer l'environnement
    - plan ne modifie rien et affiche les changements prévus, les dépendences.
    - apply applique les changements en mettant à jour le tfstate

2. un provider terraform fait le lien entre terraform et les plateformes. (voir https://registry.terraform.io/)

3. le tfstate faire la relation entre les ressources du code et les objets.

4. les variables sont utilisés pour faire des environneemnts différent (test, production, etc.). les outputs affichent les informations utiles (nom des conteneurs, url)

5. une dérive de configuration décrit une différence dans le code et dans la réalité de de l'infrastructure. 

6. une infrastructure as code est basé sur des fichiers, on peut la dupliquer facilement.
une configuration manuelle n'utilise pas de fichiers, juste des commandes manuelle et augmente grandement le risque d'erreur pendant la rédaction.

7. Cela permet de facilement versionner et de basculer d'une version à l'autre, et de facilement comparer le travail des autres via le système de PR.

8. CI = Continious Integration, pour faire des vérifications à hcaque push et CD = Continuios Deployement, la pipeline applique les changements sur le bon environnement

9. Car une modification faite peut avoir des effets inattendues et poser des problèmes à l'infrastructure

10. il ne faut jamais les commit sur le dépot git, et ne pas les écrire en dur dans le code.