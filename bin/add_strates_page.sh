#!/bin/bash

if [[ "${_has_acf_flex}" != '1' ]];then
    return 0;
fi;

###################################
## Add strates
###################################

read -p "Add strates ? (y/N) " add_strates;
if [[ $add_strates == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_strates_page.php" >> "${mainfile}";
fi;
