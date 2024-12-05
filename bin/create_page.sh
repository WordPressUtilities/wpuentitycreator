#!/bin/bash

###################################
## Create page template
###################################

page_tpl_file="${theme_dir}/page-${entity_id}.php";

if [ -d ${theme_dir} ];then
    create_page=$(bashutilities_get_yn "Create page template ?" 'y');
    if [[ $create_page != 'n' ]]; then
        cp "${SOURCEDIR}tpl/default-page.php" "${page_tpl_file}";
        if [[ $add_strates == 'y' ]]; then
            wpuentitycreator_sed "s/the_content()/echo get_wpu_acf_flexible_content('entitypluralid-blocks')/g" "${page_tpl_file}";
        fi;
        if [[ $add_contact_form == 'y' ]]; then
            wpuentitycreator_sed "s/the_content()/the_content();do_action('wpucontactforms_content', false, 'entitypluralid-form')/g" "${page_tpl_file}";
        fi;

        wpuentitycreator_replace_vars "${page_tpl_file}";
    fi;
fi;

## Insert in DB
if [ "$(type -t wp)" = "file" ]; then
    . "${SOURCEDIR}bin/clean.sh";
    new_page_id=$(wp post create --post_type=page --post_status=publish --post_title="${entity_name}" --porcelain);
    wp post update "${new_page_id}" --page_template="page-${entity_id}.php"
    wp option update "${entity_id}__page_id" "${new_page_id}";
fi
