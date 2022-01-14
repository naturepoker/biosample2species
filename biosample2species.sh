#!/usr/bin/env bash


#let's take a list of biosample accessions as the first argument following initialization of the script
#i.e. ./biosample2species.sh list.txt
biosample_list="$1"

#first, we need to create a temporary file containing all urls appended with the biosample accessions from the list
while IFS= read -r line;
do echo "https://www.ncbi.nlm.nih.gov/biosample/$line" >> $biosample_list.tmp;
done < "$biosample_list"

#once the list is complete, we simply use xargs to feed the urls to curl, temporarily obtaining the html code from the ncbi pages
#html contents are piped to grep to look for lines between h2 class="title"> and </h2>$class - which at the time of this writing contains descriptive title for the sample corresponding to the biosample accession
xargs < $biosample_list.tmp curl | grep -oP '(?<=h2 class="title">).+?(?=</h2>)' >> $biosample_list.names

#removing the temporary url file
rm $biosample_list.tmp
