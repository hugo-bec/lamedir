#!/bin/bash 

if 

for fichier in * ;
do
	if [[ "${fichier#*.}" = "flac" ]]; then	# il faut aussi vérifier que ce n'est pas un repertoire avec [ -d FILE ]
		echo "------------------------------------"
		echo $fichier;
		#fichierf=$(echo $fichier | sed 's/ /\\ /g');
		#echo $fichierf;

		exec `lame -V2 -b 320 "$fichier" "${fichier%%.*}.mp3"`;
	fi
done
