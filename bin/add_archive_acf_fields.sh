#!/bin/bash

###################################
## Add ACF fields on archive
###################################

read -p "Add ACF fields on archive ? (y/N) " add_archive_acf_fields;
if [[ $add_archive_acf_fields == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_archive_acf_fields.php" >> "${mainfile}";
fi;
