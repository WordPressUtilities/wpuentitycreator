#!/bin/bash

###################################
## Register taxonomy
###################################

read -p "Add taxonomy metas ? (y/N) " add_taxometas;
if [[ $add_taxometas == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_taxometas_tax.php" >> "${mainfile}";
fi;
