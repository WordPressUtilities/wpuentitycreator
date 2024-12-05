#!/bin/bash

###################################
## Add post type to master blocks
###################################

add_to_blocks=$(bashutilities_get_yn "Add post type to master blocks ?" 'n');
if [[ $add_to_blocks == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_to_blocks.php" >> "${mainfile}";
fi;
