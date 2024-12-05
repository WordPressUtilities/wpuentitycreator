#!/bin/bash

###################################
## Hide page in front
###################################

hide_page=$(bashutilities_get_yn "Hide page ?" 'n');
if [[ $hide_page == 'y' ]]; then
    cat "${SOURCEDIR}inc/hide_page.php" >> "${mainfile}";
fi;
