#!/bin/bash

###################################
## Create tax
###################################

if [ -d ${theme_dir} ];then
    read -p "Create archive template ? (Y/n) " create_entity_plural;
    if [[ $create_entity_plural != 'n' ]]; then
        page_tpl_file="${theme_dir}/taxonomy-${entity_pluralid}.php";
        cp "${SOURCEDIR}tpl/default-tax.php" "${page_tpl_file}";
        wpuentitycreator_replace_vars "${page_tpl_file}";
    fi;
fi;
