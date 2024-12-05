#!/bin/bash

###################################
## Add column
###################################

add_taxo_column=$(bashutilities_get_yn "Add an admin column ?" 'n');
if [[ $add_taxo_column == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_taxo_column.php" >> "${mainfile}";
fi;
