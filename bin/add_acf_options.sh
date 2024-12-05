#!/bin/bash

if [[ "${_has_acf_flex}" != '1' ]];then
    return 0;
fi;

###################################
## Add ACF options
###################################

add_options=$(bashutilities_get_yn "Add ACF options ?" 'n');
if [[ $add_options == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_acf_options.php" >> "${mainfile}";
fi;
