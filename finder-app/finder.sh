#!/bin/bash

#echo "Name of this script: "$0
#echo "Number of Arguments passed in: "$#
#echo "Exit status of the last program: "$?

if [ $# -ge 2 ]
then
  #echo "First Argument (filesdir): "$1
  #echo "Second Argument (searchstr): "$2
  filesdir=$1
  searchstr=$2
  #dir -1 $filesdir ;
  #if [ $? -ne 0 ]
  if [ ! -d $filesdir ]
  then
    echo $filesdir" is not a directory"
    exit 2
  else
    #echo "Found directory"
    number_of_files=$(dir -1 $filesdir | wc -l)
    #echo "The number of files are "$number_of_files
    number_of_matching_lines=$(grep $searchstr $filesdir/* | wc -l)
    echo "The number of files are "$number_of_files" and the number of matching lines are "$number_of_matching_lines
  fi
  exit 0
else
  echo "Usage: ./finder.sh filesdir searchstr"
  exit 1
fi
