#!/bin/bash 

if [ $# -eq 2 ]; then

inputd=$1;
outputd=$2;

	if [ -d $inputd ] && [ -d $outputd ]; then

		for fichier in $inputd* ;
		do
			if ! [[ -d $fichier ]] && [[ "${fichier#*.}" = "flac" ]]; then
				echo "------------------------------------"
				echo  Fichier: $fichier;
				#fichierf=$(echo $fichier | sed 's/ /\\ /g');
				#echo $fichierf;

				lame -V2 -b 320 "$fichier" "${fichier%%.*}.mp3";
			fi
		done

	else
		echo "ERREUR: un des deux arguments n'est pas un répertoire existant";
	fi

else 
	echo "ERREUR: nb arg différent de deux. Veuillez spécifier le répertoire d'entrée et de sortie";
fi
