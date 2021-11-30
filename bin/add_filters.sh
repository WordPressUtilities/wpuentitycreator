#!/bin/bash

###################################
## Add filters
###################################

read -p "Add filters ? (y/N) " add_filters;
if [[ $add_filters == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_filters.php" >> "${mainfile}";
fi;
