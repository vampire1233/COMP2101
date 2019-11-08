#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number

read -p "Enter first number: " firstnum
read -p "Enter second number: " secondnum

sum=$(($firstnum + $secondnum))
subtraction=$(($firstnum - $secondnum))
multiplication=$(($firstnum * $secondnum))
dividend=$(($firstnum / $secondnum))
module=$(($firstnum % $secondnum))
power=$(($firstnum**$secondnum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

cat <<EOF
$firstnum plus $secondnum is $sum
$firstnum subtract by $secondnum is $subtraction
$firstnum multiply by $secondnum is $multiplication
$firstnum raised to the power of $secondnum is $power
$firstnum divided by $secondnum gives $dividend with a remainder of $module
  - More precisely, it is $fpdividend
EOF
