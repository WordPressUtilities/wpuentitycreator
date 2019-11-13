#!/bin/bash

echo '####';
echo '#### WPU Entity Creator';
echo '#### v 0.16.0';
echo '####';
echo '';

###################################
## Config
###################################

MAINDIR="${PWD}/";
SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";

###################################
## Check path
###################################

if [[ "${MAINDIR}" != *"mu-plugins"* ]]; then
    echo "The script did not start in a mu-plugins directory.";
    return 0;
fi

###################################
## Entity type
###################################

if [[ "${1}" == 'p' || "${1}" == 'page' ]]; then
    entity_typename='page';
    entity_type='p';
elif [[ "${1}" == 'c' || "${1}" == 'custom' ]]; then
    entity_typename='entity';
    entity_type='c';
else
    entity_typename='page';
    read -p "Is this entity a [p]age or a [c]ustom post type ? (p/C) " entity_type;
    if [[ $entity_type != 'p' ]]; then
        entity_typename='entity';
        entity_type='c';
    fi;
fi;


. "${SOURCEDIR}bin/functions.sh";
. "${SOURCEDIR}bin/config.sh";
. "${SOURCEDIR}bin/create_file.sh";

# Custom post type
if [[ $entity_type == 'c' ]]; then
    . "${SOURCEDIR}bin/register_post_type.sh";
    . "${SOURCEDIR}bin/add_taxometas.sh";
    . "${SOURCEDIR}bin/prevent_single.sh";
    . "${SOURCEDIR}bin/create_entity.sh";
    . "${SOURCEDIR}bin/add_strates_posttype.sh";
    . "${SOURCEDIR}bin/add_options.sh";
    . "${SOURCEDIR}bin/add_post_metas.sh";
    . "${SOURCEDIR}bin/add_thumbnails.sh";
    . "${SOURCEDIR}bin/add_widget.sh";
    . "${SOURCEDIR}bin/add_admin_widget.sh";
fi;

# Page
if [[ $entity_type == 'p' ]]; then
    . "${SOURCEDIR}bin/add_page.sh";
    . "${SOURCEDIR}bin/create_page.sh";
    . "${SOURCEDIR}bin/hide_page.sh";
    . "${SOURCEDIR}bin/add_post_metas.sh";
    . "${SOURCEDIR}bin/add_strates_page.sh";
fi;

. "${SOURCEDIR}bin/clean.sh";
