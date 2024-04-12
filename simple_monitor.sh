echo "Welcome in your system report !"
echo "We are the $(date +"%a %b %d %I:%M %p")."
echo "You're currently logged in as $(whoami)."
echo "Your ip address is: $(ip a show ens33 | awk '/inet / {split($2, ip, "/"); print ip[1]}')"
ping -c 1 google.com > /dev/null 2>&1 && echo "Internet status: Connected." || echo "Internet status: Disconnected."
cpu_usage=$(sar -u 1 1 | grep Average | awk '{print 100 - $NF}')
threshold=95
remaining=$((threshold - cpu_usage))
if [ $(echo "$cpu_usage >= $threshold" | bc) -eq 1 ]; then
    echo "CPU is almost full !"
else
    echo "You have" $remaining"% of remaining CPU."
fi
echo "Here's a quick overview of you're remaining disk space:"
df -h
echo "You're machine is on since $(uptime | awk '{print $3,$4}' | cut -f1 -d,) hours."
echo "Currently logged-in users on your machine. (check if nothing is suspicious)"
w
echo "Services actually running on your machine:"
sudo systemctl list-units --type=service | grep "running" | sed -e 's/loaded.*running.*/running/g' -e 's/.service//g'
echo "What is going on the network right now:"
netstat -rn
echo "Here are the crons runnned  by your user:"
crontab -l | grep -v '^#'
echo "This script is part of a cron that will run everyday to give you a report of your system. You can see the log in /home/thomas/monitor/log(date).log"