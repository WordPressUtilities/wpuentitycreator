#!/bin/bash

# Extract prefix
use_tmp_prefix='n';
for _file in ./*_*.php; do
    tmp_prefix=$(echo "${_file}" | tr '_' '\n' | head -1);
    tmp_prefix=${tmp_prefix/\.\//};
    if [[ $tmp_prefix == '' ]]; then
        continue;
    fi;
    read -p "Use '${tmp_prefix}' as the project prefix [Y/n] : " use_tmp_prefix;
    if [[ $use_tmp_prefix != 'n' ]]; then
        project_prefix="${tmp_prefix}";
        break 1;
    fi;
done;

###################################
## Get config
###################################

if [[ $use_tmp_prefix == 'n' ]]; then
    read -p "What's the project prefix ? (Default:'project') " project_prefix;
    if [[ $project_prefix == '' ]]; then
        project_prefix="project";
    fi;
fi;

# Entity ID
read -p "What's the ${entity_typename} singular id ? (Default:'${entity_typename}') " entity_id;
if [[ $entity_id == '' ]]; then
    entity_id="${entity_typename}";
fi;

# Entity plural ID
if [[ $entity_type == 'c' ]]; then
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
else
    entity_pluralid="page${entity_id}";
fi;
mainfile="${MAINDIR}${project_prefix}_${entity_pluralid}.php";


# Entity name
a=`echo ${entity_id} | cut -c1 | tr [:lower:] [:upper:]`;
default_entity_name=`echo ${entity_id} | sed "s/./$a/"`;
read -p "What's the ${entity_typename} singular name ? (Default:'${default_entity_name}') " entity_name;
if [[ $entity_name == '' ]]; then
    entity_name="${default_entity_name}";
fi;

# Entity plural
if [[ $entity_type == 'c' ]]; then

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
else
    entity_plural="Page ${entity_name}";
fi;

