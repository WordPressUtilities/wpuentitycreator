#!/bin/bash

if [[ ${prevent_archive} == 'y' ]];then
    return 0;
fi;

###################################
## Add filters
###################################

add_filters=$(bashutilities_get_yn "Add filters ?" 'n');
if [[ $add_filters == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_filters.php" >> "${mainfile}";
fi;
