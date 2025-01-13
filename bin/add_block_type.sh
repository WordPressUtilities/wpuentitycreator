#!/bin/bash

###################################
## Add a block type
###################################

## Block Model
###################################

_block_model_name="";
if [[ -f "${SOURCEDIR}tools/wpu_acf_flexible/blocks/${entity_id}/model.php" ]];then
    _block_model_name_test=$(bashutilities_get_yn "The model '${entity_id}' exists, do you want to use it?" 'y');
    if [[ "${_block_model_name_test}" == 'y' ]];then
        _block_model_name="${entity_id}";
    fi;
fi;

# Ask type
if [[ "${_block_model_name}" == "" ]];then
    _block_model_name=$(bashutilities_get_user_var "Is it a block model? Type the ID here to specify it" '');
fi;
if [[ "${_block_model_name}" != '' ]];then
    cat "${SOURCEDIR}tpl/blocks/0-header.txt" >> "${mainfile}";
    cat "${SOURCEDIR}tpl/blocks/0-wpuacfmodel.txt" >> "${mainfile}";

    _block_custom_classname=$(bashutilities_get_yn "Do you need a custom classname ?" 'y');
    if [[ "${_block_custom_classname}" == 'y' ]];then
        cat "${SOURCEDIR}tpl/blocks/0-wpuacfmodel-classname.txt" >> "${mainfile}";
    fi;

    _block_custom_override_fields=$(bashutilities_get_yn "Do you need to override fields ?" 'n');
    if [[ "${_block_custom_override_fields}" == 'y' ]];then
        cat "${SOURCEDIR}tpl/blocks/0-wpuacfmodel-overridefields.txt" >> "${mainfile}";
    fi;

    bashutilities_sed "s/wpuacfmodelid/${_block_model_name}/g" "${mainfile}";
    return;
fi;

## Default type
###################################

add_block_type='';
while [ -z $add_block_type ]; do
    read -p "What block type do you need ? ([c]tatitle,[e]mpty,[r]epeater,c[u]stom,co[n]ditional,relationshi[p]) : " add_block_type;

    if [[ "${add_block_type}" == "" ]];then
        continue
    fi;

    # Add Header
    cat "${SOURCEDIR}tpl/blocks/0-header.txt" >> "${mainfile}";
    # Add Before
    cat "${SOURCEDIR}tpl/blocks/0-before.txt" >> "${mainfile}";

    # Type CTA-Title
    if [[ $add_block_type == 'c' || $add_block_type == 'ctatitle' ]]; then
        cat "${SOURCEDIR}tpl/blocks/ctatitle.txt" >> "${mainfile}";
    fi;
    # Type Repeater
    if [[ $add_block_type == 'r' || $add_block_type == 'repeater' ]]; then
        cat "${SOURCEDIR}tpl/blocks/repeater.txt" >> "${mainfile}";
    fi;
    # Type Conditional
    if [[ $add_block_type == 'n' || $add_block_type == 'conditional' ]]; then
        cat "${SOURCEDIR}tpl/blocks/conditional.txt" >> "${mainfile}";
    fi;
    # Type Relationship
    if [[ $add_block_type == 'p' || $add_block_type == 'relationship' ]]; then
        cat "${SOURCEDIR}tpl/blocks/relationship.txt" >> "${mainfile}";
    fi;
    # Type empty
    if [[ $add_block_type == 'e' || $add_block_type == 'empty' ]]; then
        cat "${SOURCEDIR}tpl/blocks/empty.txt" >> "${mainfile}";
    fi;
    # Type custom
    if [[ $add_block_type == 'u' || $add_block_type == 'custom' ]]; then
        continue_add_block_custom_value='1';
        while [ ! -z $continue_add_block_custom_value ]; do
            _f_type='';
            while [ -z $_f_type ]; do
                read -p "What field type ? ([t]itle,[i]mage,[c]ta,[v]ideo,[r]epeater,co[n]ditional,true[f]alse,relationshi[p]) : " _f_type;
                if [[ "${_f_type}" == "" ]];then
                    echo '- Empty field type, ignoring this field.'
                    continue;
                fi;

                if [[ "${_f_type}" != 'r' && "${_f_type}" != 'repeater' && "${_f_type}" != 'n' && "${_f_type}" != 'conditional' && "${_f_type}" != 'p' && "${_f_type}" != 'relationship' ]];then
                    read -p "What is the ID of the field ? : " add_block_custom_field_id;
                    if [[ "${add_block_custom_field_id}" == "" ]];then
                        echo '- Empty field ID, using field type as ID.'
                        add_block_custom_field_id="${_f_type}";
                    fi;
                fi;

                add_block_custom_field_value="";

                # Field type title
                if [[ "${_f_type}" == 't' || "${_f_type}" == 'title' ]];then
                    add_block_custom_field_value="'wpuacf_title'";
                fi;

                # Field type cta
                if [[ "${_f_type}" == 'c' || "${_f_type}" == 'cta' ]];then
                    add_block_custom_field_value="'wpuacf_cta'";
                fi;

                # Field type image
                if [[ "${_f_type}" == 'i' || "${_f_type}" == 'image' ]];then
                    add_block_custom_field_value="array('type' => 'wpuacf_image', 'min_width' => 600, 'min_height' => 400)";
                fi;

                # Field type video
                if [[ "${_f_type}" == 'v' || "${_f_type}" == 'video' ]];then
                    add_block_custom_field_value="'wpuacf_video'";
                fi;

                # Field type true false
                if [[ "${_f_type}" == 'f' || "${_f_type}" == 'truefalse' ]];then
                    add_block_custom_field_value="array('label' => '${add_block_custom_field_id}','type' => 'true_false', 'ui' => 1)";
                fi;

                # Field type repeater
                if [[ "${_f_type}" == 'r' || "${_f_type}" == 'repeater' ]];then
                    cat "${SOURCEDIR}tpl/blocks/repeater.txt" >> "${mainfile}";
                fi;

                # Field group type conditional
                if [[ "${_f_type}" == 'n' || "${_f_type}" == 'conditional' ]];then
                    cat "${SOURCEDIR}tpl/blocks/conditional.txt" >> "${mainfile}";
                fi;

                # Field group type relationship
                if [[ "${_f_type}" == 'n' || "${_f_type}" == 'relationship' ]];then
                    cat "${SOURCEDIR}tpl/blocks/relationship.txt" >> "${mainfile}";
                fi;

                # Insert field value
                if [[ "${add_block_custom_field_value}" != "" ]];then
                    _indent_3="            ";
                    echo "${_indent_3}'${add_block_custom_field_id}' => ${add_block_custom_field_value}," >> "${mainfile}";
                fi;
            done
            read -p "Do you need another field ? Type Enter to stop or anything else to continue : " continue_add_block_custom_value;
        done;

    fi;
    # Type Empty : no content needed

    # Add after
    cat "${SOURCEDIR}tpl/blocks/0-after.txt" >> "${mainfile}";
done

