# systeme-et-scripting
Projet: Gestion de l'espace disque
Objectif:
On se propose de créer un script disque.sh qui permet de lister, un par un, tous les fichiers
faisant plus de 100 Ko dans l'arborescence du répertoire /home/utilisateur. Donnez à
l'utilisateur la possibilité de supprimer ou de compresser le fichier.
Fonctionnalités
1. Ecrire la fonction show_usage qui affiche sur la sortie standard le message
" disque.sh: [-h] [-j] [-s] [-p] [-l] [-v] [-m] [-g] chemin.." .
2. Le script doit tester la présence d’au moins un argument, sinon il affiche l’usage sur la
sortie d’erreur et échoue.
3. fonction nommée HELP qui permet d’afficher le help à partir d’un fichier texte contenant
une description bien détaillée de l’application.
4. Une fonction qui permet de lister, un par un, tous les fichiers faisant plus de 100 Ko dans
l'arborescence du répertoire /home/utilisateur.
5. Une fonction qui permet de supprimer un fichier si sa taille dépasse 100 Ko
6. Une fonction qui permet de compresser un fichier si sa taille dépasse 100 Ko.
7. Une fonction qui prend en arguments plusieurs fichiers de taille supérieur à 100 Ko et
donne à l’utilisateur la possibilité de supprimer ou de compresser.
8. Une fonction qui permet d’écrire un journal avec le nom de tous les fichiers supprimés et
l'heure de leur suppression.
Options :
• -h: Pour afficher le help détaillé à partir d’un fichier texte
• -g: Pour afficher un menu textuel et gérer les fonctionnalités de façon
graphique(Utilisation de YAD).
• -v: Pour afficher le nom des auteurs et la version du code.
• -j : créer le fichier journal des fichiers supprimés
• -c : compresser un fichier
• -s : supprimer un fichier
• -p : parcourir des fichiers pour supprimer ou compresser
• -l : lister des fichiers de taille supérieur à 100ko
• -m : pour afficher un menu textuel (en boucle) qui permet d'accéder à chaque fonction
