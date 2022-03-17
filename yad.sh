#!/bin/bash
. analyse.sh



while getopts "hvgmnpGt" option
do

	case $option in
		h) 	HELPYAD
			;;
		v)	author_yad
			;;
		g)	menu_yad
			;;
		m)	menu_textuel		
			;;
		n)  	count_users_yad
			;;
		p)  	show_home_directory_yad
			;;
		G)  	show_users_inGroupy_yad
			;;
		t)	userTypeYad 
			;;
	esac
done


