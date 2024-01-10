#!/bin/bash

# Create a random date and time
# Create a random year between 2000 and the current year
current_year=$(date "+%Y")
difference_years=$(( current_year - 2000 ))
random_year=$(( RANDOM % $difference_years + 2000 ))

# Create a random month between 01 and 12
random_month=$(printf %02d $(( RANDOM % 12 + 1 )))
 
# Create a random day between 01 and 28
random_day=$(printf %02d $(( RANDOM % 28 + 1 )))

# Create a random hour between 00 and 23
random_hour=$(printf %02d $(( RANDOM % 23 + 1 )))

# Create a random minute between 00 and 59
random_minute=$(printf %02d $(( RANDOM % 59 + 1 )))

# Create a random second between 00 and 59
random_second=$(printf %02d $(( RANDOM % 59 + 1 )))

# Create a random date and time
random_date_time="$random_year-$random_month-$random_day $random_hour:$random_minute:$random_second"

# Echo the random date and time
echo "The newly generated random datetime is $random_date_time."

# Grep the datetime from the file random_log.txt and store it in a variable
grep_date=$(grep -oP '\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}' random_log.txt | tail -1)

# Echo the date from the file random_log.txt
echo "The last datetime from the file random_log.txt is $grep_date."

# Calculate the difference between the random date and time and the date and time from the file random_log.txt
datetime_difference=$(( $(date -d "$random_date_time" +%s) - $(date -d "$grep_date" +%s) ))

# Make sure that the datetime_difference is positive
if [ $datetime_difference -lt 0 ]
then
    datetime_difference=$(( datetime_difference * -1 ))
fi

# Echo the difference between the random date and time and the date and time from the file random_log.txt
echo "The difference between the new random datetime and the last datetime \
from the file random_log.txt is $((datetime_difference / 60 / 60 / 24)) days."

echo "That are more or less $((datetime_difference / 60 / 60 / 24 / 365)) years."
