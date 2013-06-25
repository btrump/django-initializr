#!/bin/bash
if (( $# != 1 )); then
	echo "usage: install.sh <project name>"
	exit
fi

old_project_name=djangoinitializr
new_project_name=$1
date_format=`date +%Y-%m-%d`
backup_extension=".$date_format.backup"

echo "Installing project as '$1'"
echo "Old project name: $old_project_name"
echo "Backup extension: $backup_extension"
find . -name "*.py" -exec sed -i.`date +%Y-%m-%d`.backup 's/$djangoinitializr/$1/g' {} \;
mkdir backup
find . -name "*$backup_extension" 