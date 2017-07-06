# idrac_password
This is a simple shell script that I use to update iDRAC passwords via ssh. This requires the utility sshpass(1) to run.


drac_pass - changes iDRAC password of one or more hosts that are space seperated. You must enter the FQDN. Requires sshpass(1)
Useage:
drac_pass host1 host2 host3 ... hostn -or- drac_pass host{1..n}
 
options:
-h --help,          show brief help
