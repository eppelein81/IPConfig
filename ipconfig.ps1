$IP="0.0.0.0"
$GW="0.0.0.0"
$DNS1="0.0.0.0"
$DNS2="0.0.0.0"
$PFL="24"


echo off
pause
cls
echo "Installationsprotokoll:" > $env:computername+"_ipconfig.txt"
echo $env:computername >> $env:computername+"_ipconfig.txt"
echo $env:USERNAME >> $env:computername+"_ipconfig.txt"
Get-Date >> $env:computername+"_ipconfig.txt"
ipconfig /all >> $env:computername+"_ipconfig.txt"
echo "............................................" >> $env:computername+"_ipconfig.txt"


ipconfig
get-NetIPInterface
pause
Set-NetIPInterface -InterfaceIndex 4 -Dhcp Disabled
New-NetIPAddress -InterfaceIndex 4 -IPAddress $IP -DefaultGateway $GW -PrefixLength $PFL
Set-DNSClientServerAddress -InterfaceIndex 4 -ServerAddresses $DNS1 $DNS2
ping DZGEOBRDC12 >> $env:computername+"_ipconfig.txt"
ipconfig /all >> $env:computername+"_ipconfig.txt"
