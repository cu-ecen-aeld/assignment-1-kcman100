#!/bin/bash

if [ $# -ge 2 ]
then
  echo "First Argument (full_path_to_file): "$1
  echo "Second Argument (text_to_add): "$2
  full_path_to_file=$1
  text_to_add=$2
  #if [ ! -e $full_path_to_file ]
  #then
  #  echo $full_path_to_file" does not exist"
  #  exit 1
  #else
  #  echo "Found file: "$full_path_to_file
  # How many directory paths
  number_of_directories_in_path=$(echo $full_path_to_file | tr -cd 't' | wc -c)
  echo "number_of_directories_in_path: "$number_of_directories_in_path
  mkdir -p $(cut -d'/' --complement -f$number_of_directories_in_path <<< "$full_path_to_file")
    touch $full_path_to_file
    echo $text_to_add > $full_path_to_file
  #fi
  exit 0
else
  echo "Usage: "$0" full_path_to_file text_to_add"
  exit 1
fi


