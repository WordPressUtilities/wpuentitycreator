#!/bin/bash

###################################
## Add post type to master blocks
###################################

read -p "Add post type to master blocks ? (y/N) " add_to_blocks;
if [[ $add_to_blocks == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_to_blocks.php" >> "${mainfile}";
fi;
