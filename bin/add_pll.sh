#!/bin/bash

###################################
## Add post type to Polylang
###################################

add_pll=$(bashutilities_get_yn "Add post type to Polylang ?" 'n');
if [[ $add_pll == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_pll.php" >> "${mainfile}";
fi;
