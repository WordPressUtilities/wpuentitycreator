#!/bin/bash

echo '####';
echo '#### WPU Entity Creator';
echo '#### v 0.2';
echo '####';
echo '';

###################################
## Config
###################################

MAINDIR="${PWD}/";
SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";
EXECDIR="$( cd "${SOURCEDIR}" && pwd )/";

###################################
## Get config
###################################

read -p "What's the project prefix ? " project_prefix;
if [[ $project_prefix == '' ]]; then
    project_prefix="project";
fi;
read -p "What's the entity singular id ? " entity_id;
if [[ $entity_id == '' ]]; then
    entity_id="entity";
fi;
read -p "What's the entity plural id ? " entity_pluralid;
if [[ $entity_pluralid == '' ]]; then
    entity_pluralid="${entity_id}s";
fi;
read -p "What's the entity singular name ? " entity_name;
if [[ $entity_name == '' ]]; then
    entity_name="${entity_id}";
fi;
read -p "What's the entity plural ? " entity_plural;
if [[ $entity_plural == '' ]]; then
    entity_plural="${entity_name}s";
fi;

mainfile="${maindir}${project_prefix}_${entity_pluralid}.php";

###################################
## Create file
###################################

touch "${mainfile}";

echo "<?php

/*
Plugin Name: [${project_prefix}] ${entity_plural}
Description: Handle entity ${entity_name}
*/" > "${mainfile}";

###################################
## Register post type
###################################

cat "${SOURCEDIR}inc/register_post_type.php" >> "${mainfile}";

###################################
## Prevent single
###################################

read -p "Prevent single page ? (y/N) " prevent_single;
if [[ $prevent_single == 'y' ]]; then
    cat "${SOURCEDIR}inc/prevent_single.php" >> "${mainfile}";
fi;

###################################
## Add options
###################################

read -p "Add options ? (y/N) " add_options;
if [[ $add_options == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_options.php" >> "${mainfile}";
fi;

###################################
## Add post metas
###################################

read -p "Add post metas ? (Y/n) " prevent_single;
if [[ $prevent_single != 'n' ]]; then
    cat "${SOURCEDIR}inc/add_post_metas.php" >> "${mainfile}";
fi;

###################################
## Delete false PHP openings
###################################

sed -i '' 's/\<\?php \/\* \*\///g' "${mainfile}";

###################################
## Replace site values
###################################

sed -i '' "s/projectprefix/${project_prefix}/g" "${mainfile}";
sed -i '' "s/entityidentity/${entity_id}/g" "${mainfile}";
sed -i '' "s/entitypluralid/${entity_pluralid}/g" "${mainfile}";
sed -i '' "s/entitynameentity/${entity_name}/g" "${mainfile}";
sed -i '' "s/entitypluralentity/${entity_plural}/g" "${mainfile}";
