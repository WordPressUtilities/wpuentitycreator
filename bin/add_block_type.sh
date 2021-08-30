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
            _f_type='';
            while [ -z $_f_type ]; do
                read -p "What field type ? ([t]itle,[i]mage,[r]epeater,co[n]ditional,true[f]alse) : " _f_type;
                if [[ "${_f_type}" == "" ]];then
                    echo '- Empty field type, ignoring this field.'
                    continue;
                fi;

                if [[ "${_f_type}" != 'r' &&  "${_f_type}" != 'repeater' &&  "${_f_type}" != 'n' &&  "${_f_type}" != 'conditional' ]];then
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

                # Field type image
                if [[ "${_f_type}" == 'i' || "${_f_type}" == 'image' ]];then
                    add_block_custom_field_value="'wpuacf_image'";
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

                # Field group type condition
                if [[ "${_f_type}" == 'n' || "${_f_type}" == 'conditional' ]];then
                    cat "${SOURCEDIR}tpl/blocks/conditional.txt" >> "${mainfile}";
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

