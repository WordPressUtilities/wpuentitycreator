#!/bin/bash

if [[ "${_has_acf_flex}" != '1' ]];then
    return 0;
fi;

###################################
## Add strates
###################################

add_strates=$(bashutilities_get_yn "Add strates ?" 'n');
if [[ $add_strates == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_strates_posttype.php" >> "${mainfile}";
fi;
