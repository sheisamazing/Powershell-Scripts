﻿# Author : Ganesh Sekarbabu
# Site - https://techbrainblog.com/
# Purpose: To find which platform service controller ( PSC ) is pointing to my vCenter appliance VCSA -6.0
# Download the Plink.exe from http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
# Make sure to change the default shell to Bash ( chsh -s "/bin/bash" root )
# Reference : 


$User = 'root'
$Pswd = Read-Host 'Enter the password for the root user'
$Computer = Read-Host 'Enter the VC Appliance Name'
$plink = Read-host "Enter the path of the plink.exe "
$plinkoptions = " -v -batch -pw $Pswd"



$cmd1 = '/usr/lib/vmware-vmafd/bin/vmafd-cli get-ls-location --server-name localhost'

$remoteCommand = '"' + $cmd1 + '"'



$command = $plink + " " + $plinkoptions + " " + $User + "@" + $computer + " " + $remoteCommand

$msg = Invoke-Expression -command $command 
$msg
