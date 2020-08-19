#!/bin/bash

###################################
## Prevent single
###################################

read -p "Prevent single page ? (y/N) " prevent_single;
read -p "Prevent archive page ? (y/N) " prevent_archive;


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


