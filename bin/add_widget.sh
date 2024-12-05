#!/bin/bash

###################################
## Add a widget
###################################

add_widget=$(bashutilities_get_yn "Add a widget ?" 'n');
if [[ $add_widget == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_widget.php" >> "${mainfile}";
fi;
