#!/bin/bash

###################################
## Add a widget
###################################

read -p "Add an admin widget ? (y/N) " add_admin_widget;
if [[ $add_admin_widget == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_admin_widget.php" >> "${mainfile}";
fi;
