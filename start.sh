#!/bin/sh
#
# Define here which tasks do you want AutoGit to perform.
#
source setup.sh
source tasks.sh
				  
printf "${CYAN} \n-------------------------\n  AUTOGIT \n-------------------------\n${NC}"

while ($FLAG)
do
	# 40min = 2400 seg
	for (( i = 3; i > 0; i--)); do
	  sleep 1 &
	  printf "${NC}Next verification in ${CYAN}$i ${NC}\r"
	  wait
	done
	
	for index in ${!BRANCHES_LIST[*]}; do 
		printf "${CYAN}${BRANCHES_LIST[$index]}${NC} is in ${BRANCH_PATH[$index]}\n"
		cd ${BRANCH_PATH[index]}
		
		switch_branch ${BRANCHES_LIST[index]}
		do_fetch_rebase ${BRANCHES_LIST[index]}
		print_date
	done
done
exit
