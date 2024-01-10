#!/bin/bash

# Touch a the file random_log.txt
touch random_log.txt

# Create a random number between 1 or 100
random_number=$(( RANDOM % 100 + 1 ))

# If the random number is 50 or less, then do nothing, if the random number is more then 50, then echo the datetime into the file random_log.txt
if [ $random_number -lt 51 ]
then
    echo -e "The random number is $random_number.\nThe datetime will NOT be appended to the random_log file."
else
    echo -e "The random number is $random_number.\nThe datetime the date will be echoed into the file."
    datetime=$(date "+%Y-%m-%d %H:%M:%S")
    echo "The current datetime is $datetime." >> random_log.txt
fi
