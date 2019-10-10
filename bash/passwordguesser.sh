#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data
# TASK 2: Improve it by rewriting it to use the if command
# TASK 3: Improve it by giving them 3 tries to get it right before failing (test 3 times but only if necessary)
#           *** Do not use the exit command

read -p "Type your password: " userstr
mypassword="password"
i=1
while [ $i -lt 3 ]
do
  if [ $userstr != $mypassword ]
  then
    {
      echo "Ooops! Try again"
      read -p "Again type your password: " userstr
    }
  else
   {
    echo "Success"
    break
   }
  fi
  i=$(( $i + 1 ))
done
echo "The right passwrd is $mypassword"
