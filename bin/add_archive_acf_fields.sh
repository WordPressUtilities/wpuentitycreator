#!/bin/bash

if [[ "${_has_acf_flex}" != '1' || ${prevent_archive} == 'y' ]];then
    return 0;
fi;

###################################
## Add ACF fields on archive
###################################

add_archive_acf_fields=$(bashutilities_get_yn "Add ACF fields on archive ?" 'n');
if [[ $add_archive_acf_fields == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_archive_acf_fields.php" >> "${mainfile}";
fi;
