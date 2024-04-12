COLOR1='\033[38;5;3m'
COLOR2='\033[38;5;5m'
COLOR3='\033[38;5;6m'
COLOR4='\033[38;5;14m'
COLOR5='\033[38;5;99m'
COLOR6='\033[38;5;124m'
COLOR7='\033[38;5;150m'
COLOR8='\033[38;5;230m'
NC='\033[0m'

printf "\n"
printf "\n"


cat /home/thomas/Desktop/becode/linux/head.txt

printf "\n"
printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"
printf "\n"


neofetch

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"


# Welcome
echo "${COLOR4}Welcome in your system report !${NC}"
echo "We are the ${COLOR8}$(date +"%a %b %d %I:%M %p").${NC}"

printf "\n"

echo "You're currently logged in as ${COLOR4}$(whoami).${NC}"

printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"


# Ip address
echo "Your ip address is: ${COLOR5}$(ip a show ens33 | awk '/inet / {split($2, ip, "/"); print ip[1]}')${NC}"


# Checking if internet works
ping -c 1 google.com > /dev/null 2>&1 && echo "Internet status: ${COLOR7}Connected.${NC}" || echo "Internet status: ${COLOR6}Disconnected.${NC}"

printf "\n"


# %cpu remaining
cpu_usage=$(sar -u 1 1 | grep Average | awk '{print 100 - $NF}')
threshold=95
remaining=$((threshold - cpu_usage))

if [ $(echo "$cpu_usage >= $threshold" | bc) -eq 1 ]; then
    ./send_email.expect >/dev/null 2>&1
    echo "${COLOR6}CPU is almost full !${NC}"
else
    echo "You have${COLOR1}" $remaining"% of remaining CPU.${NC}"
fi

printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"./

cat /home/thomas/Downloads/tux.txt

printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"


# Remaining disk space

echo "${COLOR8}Here's a quick overview of you're remaining disk space:${NC}"

printf "\n"

df -h

printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"


# Current uptime
echo "You're machine is ${COLOR3}on${NC} since ${COLOR3}$(uptime | awk '{print $3,$4}' | cut -f1 -d,) hours.${NC}"

printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"


# Logged-in users

echo "${COLOR7}Currently logged-in users on your machine.${NC} (${COLOR6}check if nothing is suspicious${NC})"

printf "\n"

w

printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"


# Services runnings

echo "Services actually ${COLOR8}running on your machine:${NC}"

printf "\n"

sudo systemctl list-units --type=service | grep "running" | sed -e 's/loaded.*running.*/running/g' -e 's/.service//g'

printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

cat /home/thomas/Downloads/computer.txt

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"


# Network

echo "What is going on the ${COLOR4}network${NC} right now:"

printf "\n"

netstat -rn

printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"


# Showin cron of current user

echo "${COLOR2}Here are the crons runnned  by your user:${NC}"

crontab -l | grep -v '^#'

printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"

echo "${COLOR4}This script is part of a cron that will run everyday to give you a report of your system. You can see the log in /home/thomas/monitor/log(date).log${NC}"

printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

cat /home/thomas/Desktop/becode/linux/see.txt

printf "\n"
printf "\n"

echo "------------------------------------------------------------------------------------------------------------------------"

printf "\n"
