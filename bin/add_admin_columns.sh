#!/bin/bash

###################################
## Admin columns
###################################

read -p "Add admin columns ? (y/N) " add_admin_columns;
if [[ $add_admin_columns == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_admin_columns.php" >> "${mainfile}";
fi;
