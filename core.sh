#!/bin/sh
#
# Include here your commom functions
#
#=====COLORS===========
CYAN='\033[0;36m'
NC='\033[0m' # No Color
#======================

check_for_conflicts() {
	echo "Checking for conflicts"
	
	OUTPUT="$(git status -s)"
	if [[ $OUTPUT == *"Conflict"* || $OUTPUT == *"Unmerged"* ]]; then
		echo "There are conflicts"
		return 1
	else # There are no conflicts
		return 0 
	fi
} 

switch_branch() {
	if check_for_conflicts; then
		printf 'Switching to branch '${CYAN}${BRANCHES_LIST[index]}${NC}'\n'
		git checkout ${BRANCHES_LIST[index]}
	else
		echo "Cannot checkout branch, it has conflicts. Please resolve them manually."
	fi
}

print_date() {
	now="$(date)"		
	printf "${CYAN}\n=============================================\n"
	printf "Finished at ${CYAN}%s$now\n"
	printf "=============================================\n\n${NC}"
}
