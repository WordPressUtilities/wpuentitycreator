#!/bin/bash

###################################
## Admin columns
###################################

add_admin_columns=$(bashutilities_get_yn "Add admin columns ?" 'n');
if [[ $add_admin_columns == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_admin_columns.php" >> "${mainfile}";
fi;
