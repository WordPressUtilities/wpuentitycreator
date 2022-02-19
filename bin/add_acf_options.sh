#!/bin/bash

###################################
## Add ACF options
###################################

read -p "Add ACF options ? (y/N) " add_options;
if [[ $add_options == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_acf_options.php" >> "${mainfile}";
fi;
