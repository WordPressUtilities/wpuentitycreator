#!/bin/bash

###################################
## Prevent single
###################################

prevent_single=$(bashutilities_get_yn "Prevent single page ?" 'n');
prevent_archive=$(bashutilities_get_yn "Prevent archive page ?" 'n');

if [[ $prevent_single == 'y' && $prevent_archive == 'y' ]]; then
    cat "${SOURCEDIR}inc/prevent_single_archive.php" >> "${mainfile}";
else
    if [[ $prevent_single == 'y' ]]; then
        cat "${SOURCEDIR}inc/prevent_single.php" >> "${mainfile}";
    fi;

    if [[ $prevent_archive == 'y' ]]; then
        cat "${SOURCEDIR}inc/prevent_archive.php" >> "${mainfile}";
    fi;
fi;

# Set active post type in menu
if [[ $prevent_single == 'n' && $prevent_archive == 'n' ]]; then
    cat "${SOURCEDIR}inc/add_post_type_active_menu.php" >> "${mainfile}";
fi;
