#!/bin/bash

###################################
## Add a meta box
###################################

add_meta_box=$(bashutilities_get_yn "Add a meta box ?" 'n');
if [[ $add_meta_box == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_meta_box.php" >> "${mainfile}";
fi;
