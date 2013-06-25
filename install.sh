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

mkdir -p backup
mv $old_project_name $new_project_name
find . -name "*.py" -exec sed -i.`date +%Y-%m-%d`.backup "s/$old_project_name/$new_project_name/g" {} \;
find . -name "*$backup_extension" -exec mv {} backup \; &> /dev/null
echo "Backing up files to ./backup"
echo "Done!"