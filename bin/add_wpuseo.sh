#!/bin/bash

###################################
## Add post type to WPU SEO
###################################

read -p "Add post type to WPU SEO ? (y/N) " add_wpuseo;
if [[ $add_wpuseo == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_wpuseo.php" >> "${mainfile}";
fi;
