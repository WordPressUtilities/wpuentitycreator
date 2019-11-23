#!/bin/bash

###################################
## Save Post Action
###################################

read -p "Add a save post action ? (y/N) " save_post_posttype;
if [[ $save_post_posttype == 'y' ]]; then
    cat "${SOURCEDIR}inc/save_post_posttype.php" >> "${mainfile}";
fi;
