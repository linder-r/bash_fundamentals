#!/bin/bash

# Create a log file with the current date and time

# Create a log file
touch date_log_file.txt

# Create a variable with the current date and time
current_date=$(date "+%d %B %Y")

# Create a variable with the current day
current_day=$(date "+%d")

# Create a variable with the current weakday
current_weekday=$(date "+%A")

# Create a variable with the current hour and minute
current_hour_minute=$(date "+%H:%M")

# Test if the current day is less than 10, between 10 and 20, or greater than 20
if [ $current_day -lt 10 ]
then
    month_string="The month has just begun."
elif [ $current_day -gt 20 ]
then
    month_string="The month is almost over."
elif [ $current_day -gt 10 ] && [ $current_day -lt 20 ]
then
    month_string="We are in the middle of the month."
fi

# Calculate the number of days left in the month
# Create a variable with the current year
current_year=$(date "+%Y")

# Test if the current year is a leap year
if [ `expr $current_year % 400` -eq 0 ]
then
leap=1
elif [ `expr $current_year % 100` -eq 0 ]
then
leap=0
elif [ `expr $current_year % 4` -eq 0 ]
then
leap=1
else
leap=0
fi

# Create a variable with the current month
currrent_month=$(date "+%m")

# Create arrays with the months and the number of days in each month
month_30_days_array=(04 06 09 11)
month_31_days_array=(01 03 05 07 08 10 12)
month_28_or_29_days_array=(02)

# Test if the current month is in the month_30_days_array
if [[ " ${month_30_days_array[@]} " =~ " ${currrent_month} " ]]
then
    days_left_in_month=$((30 - $current_day))
# Test if the current month is in the month_31_days_array
elif [[ " ${month_31_days_array[@]} " =~ " ${currrent_month} " ]]
then
    days_left_in_month=$((31 - $current_day))
# Test if the current month is in the month_28_or_29_days_array
elif [[ " ${month_28_or_29_days_array[@]} " =~ " ${currrent_month} " ]]
then
    if [ $leap -eq 1 ]
    then
        days_left_in_month=$((29 - $current_day))
    else
        days_left_in_month=$((28 - $current_day))
    fi
fi

# Calculate the number of days left in the year
# Create a variable with the current day of the year
current_day_of_year=$(date "+%j")

# Test if the current year is a leap year
if [ $leap -eq 1 ]
then
    days_left_in_year=$((366 - $current_day_of_year))
else
    days_left_in_year=$((365 - $current_day_of_year))
fi

# Create a string with the variables
date_string="Today is $current_weekday, $current_date. \
\nThe time is $current_hour_minute. \
\n$month_string \
\nThere are $days_left_in_month days left in the month and $days_left_in_year days left in the year."

# Write the date and time to the log file
echo -e $date_string >> date_log_file.txt
echo "----------------------------------------" >> date_log_file.txt

# Inform the user that the string has been appended to the log file
echo "Date and time information have been appended to the log file."