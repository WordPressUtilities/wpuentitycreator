#!/bin/bash

###################################
## Add a widget
###################################

add_admin_widget=$(bashutilities_get_yn "Add an admin widget ?" 'n');
if [[ $add_admin_widget == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_admin_widget.php" >> "${mainfile}";
fi;
