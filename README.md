# tp-iac

9) un montage bind relie un fichier/dossier à un autre. cela permet de ne pas avoir a copier les fichiers à chaque modification, ou a pouvoir les modifier depuis l'image Docker

10)

- le conteneur est connecté car on l'a déclaré dans le main.tf.
- cela permet au conteneur d'accéder à nginx/docker, sinon il n'y aurait pas accès.

11) cela permet de limiter le terraform a une seule ip, par exemple sur un serveur cela empêche a des utilisateurs tiers d'y accéder et de faire des requêtes

