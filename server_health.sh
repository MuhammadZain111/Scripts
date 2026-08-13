echo "===================================="
echo "          SERVER HEALTH REPORT      " 
echo "===================================="

echo "Checking the Cpu usage"
echo "We can also check it using the top Command but that is interactive Process"

echo  "======================================="
echo  "                     "

top "Getting the quick summary"
top -bn1 | grep "Cpu"

echo "=========================================="
echo "                                          "

echo "Checking the RAM Usage"
free -h

echo  "free -h | grep Mem "
free -h | grep Mem


echo "=========================================="
echo "                                          "

echo  "Checking the  Disk Usage"
df -h

echo "=========================================="
echo "                                          "


echo  "Checking the Specifice Directory"
df -h /

echo "=========================================="
echo "                                          "



echo "                                          "

echo "Checking the Uptime"
uptime



echo "=========================================="
echo "                                          "

echo  "Checking the number of Running Processe"
ps -e --no-headers | wc -l


echo "=========================================="
echo "                                          "

echo "Another simple method  is"
ps aux |wc -l

echo "=========================================="
echo "                                          "


echo "Checking teh fialed processes"
systemctl --failed

echo "=========================================="
echo "                                          "

echo "Number of Failed Services:"
systemctl --failed --no-legend | wc -l


echo "=========================================="
echo "                                          "



echo "Checking while the Innternet is running Normally"
ping -c 1 google.com

if ping -c  google.com >  dev/null 2>&1
then
   echo  "Internet  is  Working"
else
   echo   "Innteret  is Not Working"
fi 

echo "Script Executed SuccesFully "



echo "Here is another method of checkinng the Internet""
curl -s --head --max-time 5 https://google.com > /dev/null










































































