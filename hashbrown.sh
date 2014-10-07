#!/bin/bash

#####
#
# Author: Sock5 Puppet (@sock5puppet)
# Date: 09/25/2014
# Version: 1.0.1
#
# Details: This script requests information from the user to run against
# hash tables utilized by the findmyhash script.  Available variables are
# input file, type of hash (MD5, SHA, etc.), and delimiter so the data
# can easily be viewed or imported by other programs.
#
# Version: 1.0
# Initial release
#
# Version 1.0.1
# Report on status of hash discovery during process
# Code cleanup
# Complete recreation due to file deletion, ugh.
# Ascii graphic addition
# - http://patorjk.com
#
# Future Considerations:
# * Support multi-field files
# * Include usernames
# * Input validation for hashfiles
# * Input validation for types of hashes
# * Delimiter validation and restrictions
# * Progress report during discovery
#
#####


echo "Welcome to..."

echo "
 ██╗ ██╗
████████╗    ▄▄▄▄· ▄▄▄        ▄▄▌ ▐ ▄▌ ▐ ▄
╚██╔═██╔╝    ▐█ ▀█▪▀▄ █·▪     ██· █▌▐█•█▌▐█
████████╗    ▐█▀▀█▄▐▀▀▄  ▄█▀▄ ██▪▐█▐▐▌▐█▐▐▌
╚██╔═██╔╝    ██▄▪▐█▐█•█▌▐█▌.▐▌▐█▌██▐█▌██▐█▌
 ╚═╝ ╚═╝     ·▀▀▀▀ .▀  ▀ ▀█▄▀▪ ▀▀▀▀ ▀▪▀▀ █▪

                   Hash Brown v1.0.1
                        by Sock5 Puppet (@sock5puppet)"



echo -e "\nThis program will use findmyhash to locate key to"
echo -e "password matches and output them to a file called hashbrowns.txt\n"

echo -e "NOTE: The hash file should contain only hashes, one line per hash.\n"

echo "Enter Hash File: "
read hashfile

echo -e "\nEnter Hash Type: "
read hashtype

echo -e "\nEnter Delimiter: "
read delimiter

echo -e "\n"
echo "Starting Search..."

while read hash; do
   echo -e "\tSearching Hash Value: $hash"

   hashbrown=$(findmyhash $hashtype -h $hash | grep "The original string is:" | awk '{print $NF}')

   [ -z "$hashbrown" ] && echo -e "\tNothing Found..." || echo -e "\tResult Found: $hashbrown"

   echo "$hash$delimiter$hashbrown" >> hashbrowns.txt
done < $hashfile

echo -e "\n"
echo "Results written to hashbrowns.txt"
echo -e "\tSearch Complete..."
