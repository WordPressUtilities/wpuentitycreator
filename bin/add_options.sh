#!/bin/bash

###################################
## Add options
###################################

add_options=$(bashutilities_get_yn "Add options ?" 'n');
if [[ $add_options == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_options.php" >> "${mainfile}";
fi;
