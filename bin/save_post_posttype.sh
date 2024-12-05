#!/bin/bash

###################################
## Save Post Action
###################################

save_post_posttype=$(bashutilities_get_yn "Add a save post action ?" 'n');
if [[ $save_post_posttype == 'y' ]]; then
    cat "${SOURCEDIR}inc/save_post_posttype.php" >> "${mainfile}";
fi;
