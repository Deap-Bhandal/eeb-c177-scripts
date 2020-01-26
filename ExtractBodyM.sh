#! /bin/bash 
#creating the BodyM.csv file from Pacifici data
#tail -n +2 takes out header in Pacifici file
#cut -d ";" -f 2-6 extracts columns 2-6 
#tr -s ";" " " replaces the ; delimiter with a space
#sort -r -n -k 6 sorts the output in reverse order with respect to body mass
#> overwrites this data to BodyM.csv
tail -n +2 ~/Developer/repos/CSB/unix/data/Pacifici2013_data.csv | cut -d ";" -f 2-6 | tr -s ";" " " | sort -r -n -k 6 > BodyM.csv
echo "The BodyM.csv file has been created"

#Question 6 (running without typing bash)
#cd to directory that holds the script: in this case eeb-c177-scripts
#run command: chmod +x ExtractBodyM.sh
#using a text editor open the .profile file located in the home directory. 
#Enter to the next available line and type PATH="$PATH:$script-path-here" so I would type PATH="$HOME/Developer/repos/eeb-c177-scripts"
#Save file


