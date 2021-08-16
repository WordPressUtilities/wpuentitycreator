#!/bin/bash

###################################
## Add a block type
###################################

add_block_type='';
while [ -z $add_block_type ]; do
    read -p "What block type do you need ? ([c]tatitle,[e]mpty,[r]epeater) : " add_block_type;
    if [[ $add_block_type == 'c' || $add_block_type == 'ctatitle' ]]; then
        cat "${SOURCEDIR}tpl/blocks/ctatitle.php" >> "${mainfile}";
    fi;
    if [[ $add_block_type == 'e' || $add_block_type == 'empty' ]]; then
        cat "${SOURCEDIR}tpl/blocks/empty.php" >> "${mainfile}";
    fi;
    if [[ $add_block_type == 'r' || $add_block_type == 'repeater' ]]; then
        cat "${SOURCEDIR}tpl/blocks/repeater.php" >> "${mainfile}";
    fi;
done

