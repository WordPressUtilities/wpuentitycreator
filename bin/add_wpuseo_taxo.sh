#!/bin/bash

###################################
## Add taxo to WPU SEO
###################################

read -p "Add taxo to WPU SEO ? (y/N) " add_wpuseo_taxo;
if [[ $add_wpuseo_taxo == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_wpuseo_taxo.php" >> "${mainfile}";
fi;
