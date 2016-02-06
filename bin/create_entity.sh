#!/bin/bash

###################################
## Create entity
###################################

theme_dir="../themes/${project_prefix}";

if [ -d ${theme_dir} ];then
    read -p "Create singular template ? (Y/n) " create_entity_singular;
    if [[ $prevent_single != 'y' && $create_entity_singular != 'n' ]]; then
        page_tpl_file="${theme_dir}/single-${entity_pluralid}.php";
        cp "${SOURCEDIR}tpl/default-singular.php" "${page_tpl_file}";
        sed -i '' "s/entityidentity/${entity_id}/g" "${page_tpl_file}";
    fi;
    read -p "Create archive template ? (Y/n) " create_entity_plural;
    if [[ $prevent_archive != 'y' && $create_entity_plural != 'n' ]]; then
        page_tpl_file="${theme_dir}/archive-${entity_pluralid}.php";
        cp "${SOURCEDIR}tpl/default-archive.php" "${page_tpl_file}";
        sed -i '' "s/entitypluralid/${entity_pluralid}/g" "${page_tpl_file}";
        sed -i '' "s/projectprefix/${project_prefix}/g" "${page_tpl_file}";
    fi;
fi;
