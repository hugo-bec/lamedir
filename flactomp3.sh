#!/bin/bash 


testv0="/home/pi/Musique/azer.123"
testv1="${testv0##*/}";
echo "testv1: $testv1";
testv2="${testv1%%.*}";
echo "testv2: $testv2";
#testv3="${}";
 
echo "test pwd: $(pwd)";

option="";
formatin=$1;
formatout=$2;
dirin=$3;
dirout=$4;
nbarg=4;

if [ ${1:0:1} = '-' ]; then
	case ${1:1} in
		o) 	echo "option lame OK";
			option=$2;
			formatin=$3;
			formatout=$4;
			dirin=$5;
			dirout=$6;
			nbarg=6;;
	esac
fi

echo "option: $option"
echo "formatin: $formatin"
echo "formatout: $formatout"
echo "dirin: $dirin"
echo "dirout: $dirout"

if [ $# -eq $nbarg ]; then

	if [ -d $dirin ] && [ -d $dirout ]; then

		for fichier in $dirin* ;
		do
		    echo "fichier dirin: $fichier";
			if ! [[ -d $fichier ]] && [[ "${fichier#*.}" = $formatin ]]; then
				echo "------------------------------------"
				echo "Fichier: $fichier";

				track="${fichier##*/}";
				echo "track: $track";
				trackname="${track%%.*}";
				echo "trackname: $trackname"

				#echo "Test fichier nom: ${fichier#*/}";
				echo "command: lame "$option" "$fichier" "$dirout$trackname.$formatout"";
				#lame -V2 -b 320 "$fichier" "$dirout${fichier##*/}.$formatout";
			fi
		done

	else
		echo "ERROR: directories dirin: \"$dirin\" OR dirout: \"$dirout\" doesn't exist.";
	fi

else 
	echo "ERROR: nb arg. 
usage: lamedir [-o LAME OPTIONS] <EXTENSION IN> <EXTENSION OUT> <DIR IN> <DIR OUT> 
(Where [] are optional).
example: lamedir -o \"-V2 -b 320\" flac mp3 ~/Musiques /var/www/html/music4all ";

fi
