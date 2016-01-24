#!/bin/bash

###################################
## Prevent single
###################################

read -p "Prevent single page ? (y/N) " prevent_single;
if [[ $prevent_single == 'y' ]]; then
    read -p "Prevent archive page ? (y/N) " prevent_archive;
    if [[ $prevent_archive == 'y' ]]; then
        cat "${SOURCEDIR}inc/prevent_single_archive.php" >> "${mainfile}";
    else
        cat "${SOURCEDIR}inc/prevent_single.php" >> "${mainfile}";
    fi;
fi;
