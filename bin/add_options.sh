#!/bin/bash

###################################
## Add options
###################################

read -p "Add options ? (y/N) " add_options;
if [[ $add_options == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_options.php" >> "${mainfile}";
fi;
