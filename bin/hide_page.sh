#!/bin/bash

###################################
## Hide page in front
###################################

read -p "Hide page ? (y/N) " hide_page;
if [[ $hide_page == 'y' ]]; then
    cat "${SOURCEDIR}inc/hide_page.php" >> "${mainfile}";
fi;
