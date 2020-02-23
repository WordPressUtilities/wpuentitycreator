#!/bin/bash

###################################
## Create page template
###################################

page_tpl_file="${theme_dir}/page-${entity_id}.php";

if [ -d ${theme_dir} ];then
    read -p "Create page template ? (Y/n) " create_page;
    if [[ $create_page != 'n' ]]; then
        cp "${SOURCEDIR}tpl/default-page.php" "${page_tpl_file}";
        wpuentitycreator_sed "s/entityidentity/${entity_id}/g" "${page_tpl_file}";
        wpuentitycreator_sed "s/entitynameentity/${entity_name}/g" "${page_tpl_file}";
    fi;
fi;

## Insert in DB
if [ "$(type -t wp)" = "file" ]; then
    . "${SOURCEDIR}bin/clean.sh";
    new_page_id=$(wp post create --post_type=page --post_status=publish --post_title="${entity_name}" --porcelain);
    wp post update "${new_page_id}" --page_template="page-${entity_id}.php"
    wp option update "${entity_id}__page_id" "${new_page_id}";
fi
