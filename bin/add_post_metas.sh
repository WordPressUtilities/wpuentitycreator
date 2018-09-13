#!/bin/bash

###################################
## Add post metas
###################################

read -p "Add post metas ? (Y/n) " add_post_metas;
if [[ $add_post_metas != 'n' ]]; then

    cat "${SOURCEDIR}inc/add_post_metas_${entity_typename}.php" >> "${mainfile}";
    cat "${SOURCEDIR}inc/add_post_metas_fields.php" >> "${mainfile}";
    while :
    do
        default_field_type='text';
        read -p "- Meta id (Default:'test'): " field_id;
        if [[ $field_id == '' ]]; then
            field_id='test';
        fi;
        read -p "- Meta name (Default:'${field_id}'): " field_name;
        if [[ $field_name == '' ]]; then
            field_name=$field_id;
        fi;


        # Try to detect various fields default types
        fields_delim="url:url;link:url;post:post;date:date;color:color;image:attachment;illu:attachment;img:attachment;is_:select";
        IFS=';' list=($fields_delim)
        for item in "${list[@]}"; do
            str_contain=${item%\:*}
            str_type=${item#*\:}

            if [[ ${field_id} == *"${str_contain}"* ]]; then
                default_field_type="${str_type}";
            fi;
        done


        read -p "- Meta type (Default:'${default_field_type}'): " field_type;
        if [[ $field_type == '' ]]; then
            field_type="${default_field_type}";
        fi;
        f_tab="    ";
        f_nl="\/\*newline\*\/";
        field_content="${f_tab}\$fields['entityidentity_${field_id}'] = array(${f_nl}${f_tab}${f_tab}'box' => 'entityidentity_details',${f_nl}${f_tab}${f_tab}'name' => __('${field_name}', '${project_prefix}'),${f_nl}${f_tab}${f_tab}'type' => '${field_type}'${f_nl}${f_tab});${f_nl}#wputentitycreatorpostfields";
        wpuentitycreator_sed "s/#wputentitycreatorpostfields/${field_content}/g" "${mainfile}";
        read -p "Add another meta field ? (Y/n) " field_new;
        if [[ $field_new == 'n' ]]; then
            break;
        fi;
    done
    wpuentitycreator_sed "s/#wputentitycreatorpostfields//g" "${mainfile}";
fi;
