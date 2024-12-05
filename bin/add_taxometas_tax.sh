#!/bin/bash

###################################
## Register taxonomy
###################################

add_taxometas=$(bashutilities_get_yn "Add taxonomy metas ?" 'n');
if [[ $add_taxometas == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_taxometas_tax.php" >> "${mainfile}";
fi;
