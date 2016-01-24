#!/bin/bash

###################################
## Add thumbnails
###################################

read -p "Add custom thumbnail sizes ? (y/N) " add_thumbnails;
if [[ $add_thumbnails == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_thumbnails.php" >> "${mainfile}";
fi;
