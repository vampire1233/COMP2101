#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
#
# Sample output:
#   Hostname        : hostname
#   LAN Address     : 192.168.2.2
#   LAN Hostname    : host-name-from-hosts-file
#   External IP     : 1.2.3.4
#   External Name   : some.name.from.our.isp

# Task 1: Add a section to the script to define variables which hold the output data for
#         each output item and move the commands which generate the data to that section so that
#         the output command only outputs the labels and single variables.

# Task 2: Add output items for the default router's name and IP address,
#         adding a name to your /etc/hosts file as needed.
# e.g.
#   Router Address  : 192.168.2.1
#   Router Hostname : router-name-from-hosts-file

# Task 3: Add output items for the network's name and IP address, adding a name to your /etc/networks file as needed.
# e.g.
#   Network Number. : 192.168.2.0
#   Network Name    : network-name-from-networks-file

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# awk is used to extract only the data we want displayed from the commands which produce extra data
# this command is ugly done this way, so generating the output data into variables is recommended to make the script more readable.
# e.g.
#   interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')

# definfing variables
myhost=$(hostname)

lanadd_sec=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')
lanadd=$(ip a s $lanadd_sec | awk '/inet /{gsub(/\/.*/,"");print $2}')

mylanhost2=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')
mylanhost=$(ip a s $mylanhost2)

lanhost=$(getent hosts $mylanhost | tr -s " " | cut -d ' ' -f2 | awk 'NR==3{print $1}')

ext_ip=$(curl -s icanhazip.com)

ext_name_sub=$(curl -s icanhazip.com)

ext_name=$(getent hosts $ext_name_sub | awk '{print $2}')

cat <<EOF
Hostname        : $myhost
LAN Address     : $lanadd
LAN Hostname    : $lanhost
External IP     : $ext_ip
External Name   : $ext_name
EOF

#adding router address and router name
routeripaddr=$(ip r | grep default | awk '{print $3}')
routername=$(getent hosts | awk 'NR==4{print $2}')

#adding network address and router Name
networkaddr=$(ip r | awk -F '[/ ]+' 'NR==3{print $1}')
networkname=$(getent networks | grep 192 | awk '{print $1}')

cat <<EOF

Route IP Address : $routeripaddr
Router Name : $routername
EOF

cat <<EOF

Network IP Address : $networkaddr
Network Name : $networkname
EOF
#adding network name
