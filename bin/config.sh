#!/bin/bash

# Extract prefix
use_tmp_prefix='y';
for f in $(ls *_*.php 2>/dev/null); do
    tmp_prefix=$(echo "${f}" | tr '_' '\n' | head -1);
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
    read -p "What's the entity plural id ? (Default:'${entity_id}s') " entity_pluralid;
    if [[ $entity_pluralid == '' ]]; then
        entity_pluralid="${entity_id}s";
    fi;
    mainfile="${MAINDIR}${project_prefix}_${entity_id}.php";
else
    entity_pluralid="page${entity_id}";
    mainfile="${MAINDIR}${project_prefix}_${entity_pluralid}.php";
fi;


# Entity name
a=`echo ${entity_id} | cut -c1 | tr [:lower:] [:upper:]`;
default_entity_name=`echo ${entity_id} | sed "s/./$a/"`;
read -p "What's the ${entity_typename} singular name ? (Default:'${default_entity_name}') " entity_name;
if [[ $entity_name == '' ]]; then
    entity_name="${default_entity_name}";
fi;

# Entity plural
if [[ $entity_type == 'c' ]]; then
    read -p "What's the entity plural ? (Default:'${entity_name}s') " entity_plural;
    if [[ $entity_plural == '' ]]; then
        entity_plural="${entity_name}s";
    fi;
else
    entity_plural="Page ${entity_name}";
fi;

