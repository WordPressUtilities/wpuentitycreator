#!/bin/bash

###################################
## Prevent single
###################################

prevent_single=$(bashutilities_get_yn "Prevent single page ?" 'n');
prevent_archive=$(bashutilities_get_yn "Prevent archive page ?" 'n');

if [[ $prevent_single == 'y' && $prevent_archive == 'y' ]]; then
    cat "${SOURCEDIR}inc/prevent_single_archive.php" >> "${mainfile}";
else
    if [[ $prevent_single == 'y' ]]; then
        cat "${SOURCEDIR}inc/prevent_single.php" >> "${mainfile}";
    fi;

    if [[ $prevent_archive == 'y' ]]; then
        cat "${SOURCEDIR}inc/prevent_archive.php" >> "${mainfile}";
    fi;
fi;

