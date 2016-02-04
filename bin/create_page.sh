#!/bin/bash

###################################
## Create page template
###################################

theme_dir="../themes/${project_prefix}";
page_tpl_file="${theme_dir}/page-${entity_id}.php";

if [ -d ${theme_dir} ];then
    read -p "Create page template ? (Y/n) " create_page;
    if [[ $create_page != 'n' ]]; then
        cp "${SOURCEDIR}tpl/default-page.php" "${page_tpl_file}";
        sed -i '' "s/entityidentity/${entity_id}/g" "${page_tpl_file}";
        sed -i '' "s/entitynameentity/${entity_name}/g" "${page_tpl_file}";
    fi;
fi;
