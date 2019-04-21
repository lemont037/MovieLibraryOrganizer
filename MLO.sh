#Gloval variabels
$libaryPath
$movieName
$newMovieName

#Function to rename the movie file name turnning off all words after a year (Pattern)
renameMovie(){
    movieExtension=$(echo $movieName | rev | cut -c1-4 | rev)       #Catching the Movie extension
    auxMovieName=$(echo ${movieName//"."/" "})                      #Replacing the dots on Movie Name with blank spaces
    newMovieName=""

    breakCriterias=("1080p" "720p" "2160p" "4K")                    #Break Criterias: movie's resolutions
    break=false

    for word in $auxMovieName
    do
        for bCrite in "${breakCriterias[@]}"                        #Testing if the word is a Break Criteria                                  
        do
            if [ "$word" = "$bCrite" ];
            then
                break=true
                break
            fi
        done
        if [ $break = true ];                                       #Testing if a Break Criteria was detected
        then
            break
        fi
        newMovieName+=" "$word                                      #Appending all words before a Break Criteria to be detected
    done
    newMovieName+=$movieExtension                                   #Adding the Movie extension
}

#Checking if the user informed a path for the Library like a parameter
#If not, the algorithm will to assume the actual folder like the Libary
if ! [ -z $1 ];
then
    libaryPath=$1
else
    libaryPath=$(pwd)
fi

#Script for each Movie Folder on Libary
for movieFolder in $libaryPath/*/
do
    echo "--------------------------------------------------------------------------------------------"
    echo "Moving: $movieFolder"                                     #Movie Folder in processing
    cd "$movieFolder"                                               #Opening the Movie Folder
    movieName=$(du -h * | sort -h -r | head -1 | cut -f2 -d "G")    #Regonazing the movie file (The largest file)
    mv $movieName ..                                                #Moving it for the Libary
    cd ..                                                           #Returning for the Libary
    rm -rf "$movieFolder"                                           #Deleting the Movie Folder
    renameMovie                                                     #Creating the new Movie Name
    mv $movieName "$newMovieName"                                   #Renaming the Movie
done