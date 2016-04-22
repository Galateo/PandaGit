#!/bin/sh
#
# Include here your custom tasks
#
source core.sh

do_fetch_rebase() {
	echo "Preparing for rebase"
	if check_for_conflicts; then
		echo 'Saving your working directory...'
		git stash
		
		echo 'Fetching changes from origin...'
		git fetch origin
		
		echo 'Rebasing...'
		git rebase origin/${BRANCHES_LIST[index]}
		
		echo 'Bringing back your previously saved changes...'
		git stash pop
	fi
} 
