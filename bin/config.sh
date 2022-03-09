#!/bin/bash

# Extract prefix from other files
project_prefix='';
tmp_prefix='';
for _file in ./*_*.php; do
    tmp_prefix=$(extract_prefix $_file);
    if [[ $tmp_prefix == '' ]]; then
        continue;
    fi;
    if [[ $tmp_prefix == '*' ]]; then
        tmp_prefix='';
        continue;
    fi;
done;

# Extract prefix from folder name
if [[ "${tmp_prefix}" == '' ]];then
    # Find most used word
    most_used_word=($(echo "${MAINDIR//htdocs\/}" | sed -r 's/\/+/\n/g' | sed '/^$/d' | sort | uniq -c | sort -n | tail -n1));
    # Extract value as 2nd part of the array (ex: 2 project -> project)
    if [[ "${most_used_word[1]}" != '' ]];then
        tmp_prefix="${most_used_word[1]}";
    fi;
fi;

# Use temporary prefix
use_tmp_prefix='n';
if [[ "${tmp_prefix}" != '' ]];then
    read -p "Use '${tmp_prefix}' as the project prefix [Y/n] : " use_tmp_prefix;
    if [[ $use_tmp_prefix != 'n' ]]; then
        project_prefix="${tmp_prefix}";
    fi;
fi;

###################################
## Get config
###################################

if [[ $project_prefix == '' ]]; then
    read -p "What's the project prefix ? (Default:'project') " project_prefix;
    if [[ $project_prefix == '' ]]; then
        project_prefix="project";
    fi;
fi;
project_prefix=$(bashutilities_string_to_slug "${project_prefix}");

# Entity ID
read -p "What's the ${entity_typename} singular id ? (Default:'${entity_typename}') " entity_id;
if [[ $entity_id == '' ]]; then
    entity_id="${entity_typename}";
fi;
entity_id=$(bashutilities_string_to_slug "${entity_id}");

# Entity plural ID
if [[ $entity_type == 'c' || $entity_type = 't' ]]; then
    default_entity="${entity_id}s";
    last_entity_char=$(echo "${entity_id: -1}");
    if [[ $last_entity_char == 'y' ]]; then
        default_entity="${entity_id%?}ies";
    fi;
    if [[ $last_entity_char == 's' ]]; then
        default_entity="${entity_id}";
    fi;
    read -p "What's the entity plural id ? (Default:'${default_entity}') " entity_pluralid;
    if [[ $entity_pluralid == '' ]]; then
        entity_pluralid="${default_entity}";
    fi;
elif [[ $entity_type == 'b' ]]; then
    entity_pluralid="block${entity_id}";
elif [[ $entity_type == 'e' ]]; then
    entity_pluralid="${entity_id}";
else
    entity_pluralid="page${entity_id}";
fi;
entity_pluralid=$(bashutilities_string_to_slug "${entity_pluralid}");
mainfile="${MAINDIR}${project_prefix}_${entity_pluralid}.php";


# Entity name
a=`echo ${entity_id} | cut -c1 | tr [:lower:] [:upper:]`;
default_entity_name=`echo ${entity_id} | sed "s/./$a/"`;
read -p "What's the ${entity_typename} singular name ? (Default:'${default_entity_name}') " entity_name;
if [[ $entity_name == '' ]]; then
    entity_name="${default_entity_name}";
fi;

# Entity plural
if [[ $entity_type == 'c' || $entity_type = 't' ]]; then
    default_entity_name="${entity_name}s";
    last_entity_char=$(echo "${entity_name: -1}");
    if [[ $last_entity_char == 'y' ]]; then
        default_entity_name="${entity_name%?}ies";
    fi;
    if [[ $last_entity_char == 's' ]]; then
        default_entity_name="${entity_name}";
    fi;

    read -p "What's the entity plural name ? (Default:'${default_entity_name}') " entity_plural;
    if [[ $entity_plural == '' ]]; then
        entity_plural="${default_entity_name}";
    fi;
elif [[ $entity_type == 'b' ]]; then
    entity_plural="Block ${entity_id}";
else
    entity_plural="Page ${entity_name}";
fi;


# Post type
tax_post_type='post';
default_tax_post_type='post';
if [[ $entity_type = 't' ]];then
    tax_post_type='post';
    read -p "What's the post type linked to this taxonomy ? (Default:'${default_tax_post_type}') " tax_post_type;
    if [[ $tax_post_type == '' ]]; then
        tax_post_type="${default_tax_post_type}";
    fi;
fi;
tax_post_type=$(bashutilities_string_to_slug "${tax_post_type}");
