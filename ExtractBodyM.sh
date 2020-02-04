#!/bin/bash 

#tail -n +2 takes out header in input file
#cut -d ";" -f 2-6 extracts columns 2-6 
#tr -s ";" " " replaces the ; delimiter with a space
#sort -r -n -k 6 sorts the output in reverse order with respect to body mass
#> overwrites this data to output file

## delimiter must be surrounded in single quotes when typing third argument

tail -n +2 $1 | cut -d "$3" -f 2-6 | tr -s "$3" " " | sort -r -n -k 6 > $2
echo "The output file has been created"










#Question 6 (running without typing bash)
#cd to directory that holds the script: in this case eeb-c177-scripts
#run command: chmod +x ExtractBodyM.sh
#using a text editor open the .profile file located in the home directory. 
#Enter to the next available line and type PATH="$PATH:$script-path-here" so I would type $PATH="$HOME/Developer/repos/eeb-c177-scripts"
#Save file


