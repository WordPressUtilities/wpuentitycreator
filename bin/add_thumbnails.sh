#!/bin/bash

###################################
## Add thumbnails
###################################

add_thumbnails=$(bashutilities_get_yn "Add custom thumbnail sizes ?" 'n');
if [[ $add_thumbnails == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_thumbnails.php" >> "${mainfile}";
fi;
