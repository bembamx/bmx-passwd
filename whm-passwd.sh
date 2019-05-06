#!/bin/bash

#bmxpassd - 2019 - tony@bemba.mx

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [ ! -z "$1" ] &&  [ -z "$2" ]
then

   echo "Password:"
   read bmxpass

   whmapi1 passwd user=$1 password=$bmxpass db_pass_update=1

   exit -1
fi


if [ -z "$1" ] && [ -z "$2" ]
then
   echo "Username:"
   read bmxuser

   echo "Password:"
   read bmxpass
   
   whmapi1 passwd user=$bmxuser password=$bmxpass db_pass_update=1
   exit -1
fi



whmapi1 passwd user=$1 password=$2 db_pass_update=1