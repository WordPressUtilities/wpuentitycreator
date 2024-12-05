#!/bin/bash

###################################
## Delete Post Action
###################################

delete_post_posttype=$(bashutilities_get_yn "Add a delete post action ?" 'n');
if [[ $delete_post_posttype == 'y' ]]; then
    cat "${SOURCEDIR}inc/delete_post_posttype.php" >> "${mainfile}";
fi;
