#!/bin/bash
#
# This script produces the dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Improve this script by using the value in the automatic variable $USER for the name
# Improve this script by adding some time and day of the week information to the welcome message
#   Use a format like this:
#   It is HH:MM AM on weekday.

###############
# Variables   #
###############
title="Overlord"
myname=$USER
hostname=$(hostname)

###############
# Main        #
###############

#date and time as per HH:MM formatted
dateandtime=$(date +"%H:%M %p")

cat <<EOF

Welcome to planet $hostname, "$title $myname!"
It is a $dateandtime on weekday

EOF
