#!/bin/bash

###################################
## Add post type to WPU SEO
###################################

add_wpuseo=$(bashutilities_get_yn "Add post type to WPU SEO ?" 'n');
if [[ $add_wpuseo == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_wpuseo.php" >> "${mainfile}";
fi;
