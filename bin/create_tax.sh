#!/bin/bash

###################################
## Create tax
###################################

if [ -d ${theme_dir} ];then
    create_entity_plural==$(bashutilities_get_yn "Create archive template ?" 'y');
    if [[ $create_entity_plural == 'y' ]]; then
        page_tpl_file="${theme_dir}/taxonomy-${entity_pluralid}.php";
        cp "${SOURCEDIR}tpl/default-tax.php" "${page_tpl_file}";
        wpuentitycreator_replace_vars "${page_tpl_file}";
    fi;
fi;
