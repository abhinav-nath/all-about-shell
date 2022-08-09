#!/bin/bash

while getopts m:h opt ; do
   case "$opt" in
      m)
      option_m_chosen="1"
      set -f #disable glob
      IFS=, #split on commas
      multi=($OPTARG) ;;

      h)    echo "LOL" ;;
   esac
done

if [ "$option_m_chosen" == "1" ] ; then
   echo "The first value of the array 'multi' is '$multi'"
   echo "The whole list of values is '${multi[@]}'"

   echo "Or:"

   for val in "${multi[@]}"; do
      echo " - $val"
   done
fi
