#!/bin/bash

help_file="HELP.txt"    #enregistrement du path du fichier text.txt dans "help_file" 



show_usage()
{
echo "analyse.sh: [-h] [-v] [-t] [-m] [-g] [-v] [-n] [-p] user.."
}




HELP()
{
cat $help_file      #affichage du contenu du fichier "text"
echo -e "\n"
}





HELPYAD(){

text=$(cat $help_file)                                      #enregistrer text help dans "text"
yad --title="Help" --center --no-buttons  --text="$text"    #afficher dans yad 

}





count_users()
{
echo -e "\e[1;92mLe nombre d’utilisateurs est: \e[0m"  
cat /etc/passwd | wc -l     #calculer et afficher
}


count_users_yad()
{

text=$(cat /etc/passwd | wc -l)          #calculer est enregistrer resultat dans "text"


yad --width=400 --title="Nombre d’utilisateurs" --center --no-buttons  --text="Le nombre d'utilisateurs est: $text"     #affichage yad

}





show_home_directory()
{

echo -e "\e[1;92mNoms des utilisateurs suivis par leurs répertoires personnels:\e[0m\n"

cut -d ":" -f 1,6 /etc/passwd           #affichage des répertoires personnels

}




show_home_directory_yad()
{

text=$(cut -d ":" -f 1,6 /etc/passwd)                #enregistrement des resultats dans "text"

yad --title="Les répertoires personnels" --center --no-buttons  --text="$text"     #affichage sur yad

}






author()
{


version=$(cat /etc/issue | rev | cut -c 6- | rev)                        #enregistrement de la version dans "version"

echo -e "\e[1;92m Auteurs: \e[0mHamda Yedes & Youssef Louhaichi "        #affichage noms auteurs                                               
echo -e "\e[1;92m Version du code: \e[0m$version"                        #affichage version code


}

author_yad()
{
version=$(cat /etc/issue | rev | cut -c 6- | rev)                        #enregistrement de la version du code dans variable "version"
yad --title="Auteurs" --center --no-buttons --text="Auteurs: Hamda Yedes et Youssef Louhaichi ~~~~Version du code: $version"
#affichage version code
}








show_users_inGroup()
{




while read line; do

if [[ "$(cut -d: -f 1 <<< "$line")" = "$1" ]];then
	var=$(echo $line | cut -d ":" -f 3)                 #GID appartir du nom de groupe
fi
done < "/etc/group" 




if [[  -z  $var  ]];then  #si le groupe n'existe pas

echo "Ce group n'existe pas!"

else    #si le groupe existe

	echo -e "\e[1;92mUtilisateurs qui ont $1 comme groupe primaire:\e[0m"

	test=false


	while read line; do

	if [[ "$(cut -d: -f 4 <<< "$line")" = "$var" ]];then
		echo $line | cut -d ":" -f 1                        #afficher les resultat trouvés
		test=true
	fi
	done < "/etc/passwd"


	if [ $test != true ];then   
	
	echo -e "Il n'y a aucun utilisateur qui a $1 comme groupe primaire\n"
	
	fi


fi
}





show_users_inGroupy_yad(){



var0=$(yad --title="Entrez le nom" --height=100 --center --form  --field="Entrez le nom du groupe:":CE)  #lecture nom du group apartir du yad

var1=$(echo $var0 | rev | cut -c 2- | rev)     #correction de la lecture (-|)


while read line; do

if [[ "$(cut -d: -f 1 <<< "$line")" = "$var1" ]];then
	var=$(echo $line | cut -d ":" -f 3)                   #GID appartir du nom de groupe
fi
done < "/etc/group" 





if [[  -z  $var  ]];then    #si le groupe n'existe pas

text=$(echo "Ce group n'existe pas!")



else   #si le groupe existe

	text=$(echo -e "Utilisateurs qui ont ce groupe comme groupe primaire:")
	
	test=false


	while read line; do

	if [[ "$(cut -d: -f 4 <<< "$line")" = "$var" ]];then
		text+=$(echo $line | cut -d ":" -f 1)               #enregistrer les resultats dans text
		test=true
	fi

	done < "/etc/passwd"

	
	if [ $test != true ];then 
	text=$(echo "Il n'y a aucun utilisateur qui a ce group comme groupe primaire")
	fi


fi

#affichage message finale avec yad

yad --title="Resultat" --center --no-buttons  --text="$text"  

}








userType()
{



while read line; do

if [[ "$(cut -d: -f 1 <<< "$line")" = "$1" ]];then     
	userID=$(echo $line | cut -d ":" -f 3);           #UID appartir du nom de l'utilisateur
fi

done < "/etc/passwd"




if [[ ! -z  $userID  ]];then  #si l'utilisateur existe 


	if [ $userID == 0 ];then
	echo -e "C'est un utilisateur \e[1;92madmin\e[0m "
	

	else if [[ $userID -lt 1000 && $userID -gt 0 ]];then
	echo -e "C'est un utilisateur \e[1;92mapplicatif\e[0m "
	

	else if [ $userID -ge 1000 ];then
	echo -e "C'est un utilisateur \e[1;92msimple\e[0m"
	fi
	fi
	fi

else    #si l'utilisateur n'existe pas

echo -e "Cet utilisateur n'existe pas!"

fi


}






userTypeYad()
{

var0=$(yad --title="Entrez le nom" --center --form  --field="Entrez le nom de l'utilisateur:":CE)   #lecture nom utilisateur apartir de yad

var1=$(echo $var0 | rev | cut -c 2- | rev)     #correction de la lecture (-|)


while read line; do

if [[ "$(cut -d: -f 1 <<< "$line")" = "$var1" ]];then       #UID appartir du nom de l'utilisateur
	userID=$(echo $line | cut -d ":" -f 3);
fi

done < "/etc/passwd"




if [[ ! -z  $userID  ]];then   #si l'utilisateur existe 


	if [ $userID == 0 ];then
	text=$(echo "C'est un utilisateur admin")
	

	else if [[ $userID -lt 1000 && $userID -gt 0 ]];then
	text=$(echo "C'est un utilisateur applicatif")
	

	else if [ $userID -ge 1000 ];then
	text=$(echo "C'est un utilisateur simple")
	fi
	fi
	fi

else    #si l'utilisateur n'existe pas

text=$(echo "Cet utilisateur n'existe pas!") 

fi

#affichage message finale avec yad

yad --title="Resultat" --center --no-buttons  --text="$text"

}





menu_textuel()
{
while (true)
	do 
		echo -e "\n"
		echo "+++++++++++++++++++++++ Menu ++++++++++++++++++++++++"
		echo "1)  : Afficher le nombre d’utilisateurs"
		echo "2)  : Afficher les répertoires personnels des utilisateurs"
		echo "3)  : Utilisateurs appartenant au même groupe"
		echo "4)  : Afficher le nom des auteurs et la version du code"
		echo "5)  : Afficher le Type de l’utilisateurs"
		echo "6)  : Help"
		echo "0)  : Quit"
		echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"

		echo "Entrez votre choix : "
		read choix
		case $choix in

				1)
		clear
		count_users
				;;
				2)
		clear
		show_home_directory	
				;;
				3)
		clear
		echo "Donnez le nom du groupe:"
		read nom
		clear
		show_users_inGroup $nom
				;;

				4)
		clear
		author
				;;

				5)
		clear
		echo "Donnez le nom de l'utilisateur:"
		read nom
		clear
		userType $nom
			
				;;

				6)
		clear
		HELP
				;;
					
				0)
		clear
		echo "Au revoir $USER"
				exit
				;;

				*)
		clear
		echo "Mauvais choix"		 			
			
				;;
		esac
	done

}




menu_yad()
{
yad --center --no-buttons --form \
 --field "Help:BTN" "./yad.sh -h" \
 --field "Nombre d’utilisateurs:BTN" "./yad.sh -n" \
 --field "Répertoires personnels des utilisateurs:BTN" "./yad.sh -p" \
 --field "Utilisateurs appartenant au même groupe:BTN" "./yad.sh -G" \
 --field "Nom des auteurs et version du code:BTN" "./yad.sh -v" \
 --field  "Type de l’utilisateurs:BTN" "./yad.sh -t" \
 --title "Menu" 
}






