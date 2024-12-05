#!/bin/bash

###################################
## Add filters
###################################

add_filters=$(bashutilities_get_yn "Add filters ?" 'n');
if [[ $add_filters == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_filters.php" >> "${mainfile}";
fi;
