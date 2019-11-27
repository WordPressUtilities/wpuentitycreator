#!/bin/bash

###################################
## Delete Post Action
###################################

read -p "Add a delete post action ? (y/N) " delete_post_posttype;
if [[ $delete_post_posttype == 'y' ]]; then
    cat "${SOURCEDIR}inc/delete_post_posttype.php" >> "${mainfile}";
fi;
