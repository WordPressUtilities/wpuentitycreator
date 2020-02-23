#!/bin/bash

###################################
## Create entity
###################################

if [ -d ${theme_dir} ];then
    if [[ $prevent_single != 'y' ]]; then
        read -p "Create singular template ? (Y/n) " create_entity_singular;
        if [[ $create_entity_singular != 'n' ]]; then
            page_tpl_file="${theme_dir}/single-${entity_pluralid}.php";
            cp "${SOURCEDIR}tpl/default-singular.php" "${page_tpl_file}";
            wpuentitycreator_sed "s/entityidentity/${entity_id}/g" "${page_tpl_file}";
        fi;
    fi;
    if [[ $prevent_archive != 'y' ]]; then
        read -p "Create archive template ? (Y/n) " create_entity_plural;
        if [[ $create_entity_plural != 'n' ]]; then
            page_tpl_file="${theme_dir}/archive-${entity_pluralid}.php";
            cp "${SOURCEDIR}tpl/default-archive.php" "${page_tpl_file}";
            wpuentitycreator_sed "s/entitypluralid/${entity_pluralid}/g" "${page_tpl_file}";
            wpuentitycreator_sed "s/projectprefix/${project_prefix}/g" "${page_tpl_file}";
        fi;
    fi;
fi;
