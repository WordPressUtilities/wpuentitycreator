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
            if [[ $add_strates == 'y' ]]; then
                wpuentitycreator_sed "s/the_content()/echo get_wpu_acf_flexible_content('entitypluralid-blocks')/g" "${page_tpl_file}";
            fi;
            wpuentitycreator_replace_vars "${page_tpl_file}";
        fi;
    fi;
    if [[ $prevent_archive != 'y' ]]; then
        read -p "Create archive template ? (Y/n) " create_entity_plural;
        if [[ $create_entity_plural != 'n' ]]; then
            page_tpl_file="${theme_dir}/archive-${entity_pluralid}.php";
            cp "${SOURCEDIR}tpl/default-archive.php" "${page_tpl_file}";
            wpuentitycreator_replace_vars "${page_tpl_file}";
        fi;
    fi;
    read -p "Create loop template ? (Y/n) " create_loop_template;
    if [[ $create_loop_template != 'n' ]]; then
        page_tpl_file="${theme_dir}/tpl/loops/loop-${entity_pluralid}.php";
        if [[ ! -d "${theme_dir}/tpl" ]];then
            mkdir "${theme_dir}/tpl";
            echo 'deny from all' > "${theme_dir}/tpl/.htaccess";
        fi;
        if [[ ! -d "${theme_dir}/tpl/loops" ]];then
            mkdir "${theme_dir}/tpl/loops";
        fi;
        cp "${SOURCEDIR}tpl/default-loop.php" "${page_tpl_file}";
        wpuentitycreator_replace_vars "${page_tpl_file}";
    fi;
fi;
