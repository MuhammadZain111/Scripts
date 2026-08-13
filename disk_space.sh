echo "--------------------------------------------------"

echo " Here is the bash script Check the disk Space Alert"


echo "---------------------------------------------------"


echo "Disk Space used is "

DISK=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')   

echo "Disk Usage:  $DISK"


echo "-----------------------------------"


if [ "$DISK" -lt 70 ]; then
    echo "OK"
elif [ "$DISK" -le 85 ]; then
    echo "WARNING"
else
    echo "CRITICAL"
fi


echo "------------------------------------"


echo "script executed sucessfully"




