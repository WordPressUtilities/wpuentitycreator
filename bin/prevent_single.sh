#!/bin/bash

###################################
## Prevent single
###################################

prevent_single=$(bashutilities_get_yn "Prevent single page ?" 'n');
prevent_archive=$(bashutilities_get_yn "Prevent archive page ?" 'n');

if [[ $prevent_single == 'y' ]]; then
    bashutilities_sed "s/wpuentitycreator_hide_singular/1/g" "${mainfile}";
else
    bashutilities_sed "s/wpuentitycreator_hide_singular/0/g" "${mainfile}";
fi;

if [[ $prevent_archive == 'y' ]]; then
    bashutilities_sed "s/wpuentitycreator_has_archive/1/g" "${mainfile}";
else
    bashutilities_sed "s/wpuentitycreator_has_archive/0/g" "${mainfile}";
fi;

# Set active post type in menu
if [[ $prevent_single == 'n' && $prevent_archive == 'n' ]]; then
    cat "${SOURCEDIR}inc/add_post_type_active_menu.php" >> "${mainfile}";
fi;
