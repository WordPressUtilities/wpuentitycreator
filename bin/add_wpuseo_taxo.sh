#!/bin/bash

###################################
## Add taxo to WPU SEO
###################################

add_wpuseo_taxo=$(bashutilities_get_yn "Add taxo to WPU SEO ?" 'n');
if [[ $add_wpuseo_taxo == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_wpuseo_taxo.php" >> "${mainfile}";
fi;
