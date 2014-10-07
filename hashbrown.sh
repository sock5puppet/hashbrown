#!/bin/bash

#####
#
# Author: Sock5 Puppet (@sock5puppet)
# Date: 10/07/2014
# Version: 1.0.1
#
# Usage: ./hashbrown.sh
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
