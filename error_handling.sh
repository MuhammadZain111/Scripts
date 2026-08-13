
echo " Awk command is Used for Searching the required text from the outpus or soem text  "

echo "-------------------------------------------"

echo "The disk space present is as under"
df -h

echo "--------------------------------------------"


echo "We might Produce the same result"
df -h / |awk 'NR==2 {print $5}'

echo "Here the NR is Record and line Number"

echo "---------------------------------------------"


echo "Here we will remove the % from the result"


df -h / | awk 'NR==2 {gsub("%","",$5); print $5}'

echo "-----------------------------------------------"


USAGE=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$USAGE" -gt 80 ]
then
    echo "WARNING: Disk usage is high"
    echo "Disk usage is OK"
fi




 
