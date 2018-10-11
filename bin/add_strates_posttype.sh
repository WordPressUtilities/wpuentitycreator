#!/bin/bash

###################################
## Add strates
###################################

read -p "Add strates ? (y/N) " add_strates;
if [[ $add_strates == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_strates_posttype.php" >> "${mainfile}";
fi;
