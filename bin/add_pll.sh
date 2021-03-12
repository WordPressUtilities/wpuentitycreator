#!/bin/bash

###################################
## Add post type to Polylang
###################################

read -p "Add post type to Polylang ? (y/N) " add_pll;
if [[ $add_pll == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_pll.php" >> "${mainfile}";
fi;
