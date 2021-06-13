#!/bin/bash

###################################
## Add column
###################################

read -p "Add an admin column ? (y/N) " add_taxo_column;
if [[ $add_taxo_column == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_taxo_column.php" >> "${mainfile}";
fi;
