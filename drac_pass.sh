#!/bin/bash
package="drac_pass"
hosts=`echo $@`
while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "$package - changes iDRAC password of one or more hosts that are space seperated. You must enter the FQDN. Requires sshpass(1)"
      echo "Useage:"
      echo "$package host1 host2 host3 ... hostn -or- $package host{1..n}"
      echo " "
      echo "options:"
      echo "-h --help,          show brief help"
      exit 0
      ;;
    *)
      shift
      read -s -p "Current DRAC password: " cp1
      echo " "
      read -s -p "Re-enter current DRAC password: " cp2
       while [ "$cp1" != "$cp2" ];
        do
           echo " "
           echo "Passwords do not match"
           read -s -p "Current DRAC password: " cp1
           echo " "
           read -s -p "Re-enter current DRAC password: " cp2
        done
     echo " "
     read -s -p "New DRAC password: " np1
     echo " "
     read -s -p "Re-enter new DRAC password: " np2
        while [ "$np1" != "$np2" ];
         do
            echo " "
            echo "Passwords do not match"
            read -s -p "New DRAC password: " np1
            echo " "
            read -s -p "Re-enter new DRAC password: " np2
         done
      echo " "
      echo "Changing DRAC password"
      for host in $hosts ; do sshpass -p $cp1 ssh -o StrictHostKeyChecking=no root@$host racadm config -g cfgUserAdmin -o cfgUserAdminPassword -i 2 $np1 ; done
      exit 0
    esac
done
