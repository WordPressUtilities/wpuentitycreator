#!/bin/bash

###################################
## Add a block type
###################################

add_block_type='';
while [ -z $add_block_type ]; do
    read -p "What block type do you need ? ([c]tatitle,[e]mpty,[r]epeater,c[u]stom,co[n]ditional) : " add_block_type;

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
    # Type Repeater
    if [[ $add_block_type == 'n' || $add_block_type == 'conditional' ]]; then
        cat "${SOURCEDIR}tpl/blocks/conditional.txt" >> "${mainfile}";
    fi;
    # Type custom
    if [[ $add_block_type == 'u' || $add_block_type == 'custom' ]]; then
        continue_add_block_custom_value='1';
        while [ ! -z $continue_add_block_custom_value ]; do
            add_block_custom_value_type='';
            while [ -z $add_block_custom_value_type ]; do
                read -p "What field type ? ([t]itle,[i]mage) : " add_block_custom_value_type;

                if [[ "${add_block_custom_value_type}" == "" ]];then
                    echo '- Empty field type, ignoring this field.'
                    continue;
                fi;
                read -p "What is the ID of the field ? : " add_block_custom_field_id;
                if [[ "${add_block_custom_field_id}" == "" ]];then
                    echo '- Empty field ID, ignoring this field.'
                    continue;
                fi;
                add_block_custom_field_value="";

                # Field type title
                if [[ "${add_block_custom_value_type}" == 't' || "${add_block_custom_value_type}" == 'title' ]];then
                    add_block_custom_field_value="'wpuacf_title'";
                fi;
                # Field type image
                if [[ "${add_block_custom_value_type}" == 'i' || "${add_block_custom_value_type}" == 'image' ]];then
                    add_block_custom_field_value="'wpuacf_image'";
                fi;

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

