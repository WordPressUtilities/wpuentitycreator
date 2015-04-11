#!/bin/bash

echo '####';
echo '#### WPU Entity Creator';
echo '#### v 0.1';
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
read -p "What's the entity id ? " entity_id;
read -p "What's the entity name ? " entity_name;
read -p "What's the entity plural ? " entity_plural;

mainfile="${maindir}${project_prefix}_${entity_id}.php";

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
## Delete false PHP openings
###################################

sed -i '' 's/\<\?php \/\* \*\///g' "${mainfile}";

###################################
## Replace site values
###################################

sed -i '' "s/entityidentity/${entity_id}/g" "${mainfile}";
sed -i '' "s/entitynameentity/${entity_name}/g" "${mainfile}";
sed -i '' "s/entitypluralentity/${entity_plural}/g" "${mainfile}";
