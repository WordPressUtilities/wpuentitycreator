#!/bin/bash

###################################
## Add a widget
###################################

read -p "Add a widget ? (y/N) " add_widget;
if [[ $add_widget == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_widget.php" >> "${mainfile}";
fi;
