#!/bin/bash

###################################
## Add a meta box
###################################

read -p "Add a meta box ? (y/N) " add_meta_box;
if [[ $add_meta_box == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_meta_box.php" >> "${mainfile}";
fi;
