#!/bin/bash

echo '####';
echo '#### WPU Entity Creator';
echo '#### v 0.38.1';
echo '####';
echo '';

###################################
## Config
###################################

SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";
_SOURCEDIR_BASHUTILITIES="${SOURCEDIR}tools/BashUtilities/"

###################################
## Check path
###################################

MAINDIR="${PWD}/";
if [[ -d "${MAINDIR}wp-content/mu-plugins/" ]];then
    echo '-> Going to the mu-plugins directory';
    MAINDIR="${MAINDIR}wp-content/mu-plugins/";
fi;

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
elif [[ "${1}" == 't' || "${1}" == 'taxo' || "${1}" == 'taxonomy' ]]; then
    entity_typename='taxo';
    entity_type='t';
else

    entity_current_dirname=$(basename "${MAINDIR}");
    default_entity_type_choice='c';
    default_entity_type_choice_string='p/t/b/C/e';

    if [[ "${entity_current_dirname}" == 'page' || "${entity_current_dirname}" == 'pages' ]];then
        default_entity_type_choice='p';
        default_entity_type_choice_string='P/t/b/c/e';
    fi;
    if [[ "${entity_current_dirname}" == 'taxonomy' || "${entity_current_dirname}" == 'taxonomies' ]];then
        default_entity_type_choice='t';
        default_entity_type_choice_string='p/T/b/c/e';
    fi;
    if [[ "${entity_current_dirname}" == 'block' || "${entity_current_dirname}" == 'blocks' ]];then
        default_entity_type_choice='b';
        default_entity_type_choice_string='p/t/B/c/e';
    fi;

    read -p "Is this entity a [p]age, a [t]axonomy, a [b]lock, a [c]ustom post type or an [e]mpty file ? (${default_entity_type_choice_string}) " entity_type_choice;

    if [[ "${entity_type_choice}" == '' ]];then
        entity_type_choice="${default_entity_type_choice}";
    fi;

    if [[ $entity_type_choice == 'c' ]]; then
        entity_typename='entity';
        entity_type='c';
    fi;
    if [[ $entity_type_choice == 't' ]]; then
        entity_typename='taxo';
        entity_type='t';
    fi;
    if [[ $entity_type_choice == 'b' ]]; then
        entity_typename='block';
        entity_type='b';
    fi;
    if [[ $entity_type_choice == 'p' ]]; then
        entity_typename='page';
        entity_type='p';
    fi;
    if [[ $entity_type_choice == 'e' ]]; then
        entity_typename='empty';
        entity_type='e';
    fi;
fi;

# Creating dir
MAINDIR_NAME=$(basename $MAINDIR);
if [[ "${entity_typename}" != "empty" && "${MAINDIR_NAME}" == 'mu-plugins' ]];then
    if [[ "${entity_typename}" == 'page' ]];then
        MAINDIR="${MAINDIR}/pages/";
    elif [[ "${entity_typename}" == 'taxo' ]];then
        MAINDIR="${MAINDIR}/taxonomies/";
    elif [[ "${entity_typename}" == 'block' ]];then
        MAINDIR="${MAINDIR}/blocks/";
    else
        MAINDIR="${MAINDIR}/entities/";
    fi;
    if [[ ! -d "${MAINDIR}" ]];then
        echo "-> Creating a directory for this ${entity_typename}";
        mkdir "${MAINDIR}";
    fi;
fi;

_wpcontentdir=$(pwd);
wpcontent_dir=$(echo "${_wpcontentdir%/mu-plugins*}");


. "${_SOURCEDIR_BASHUTILITIES}/modules/files.sh";
. "${_SOURCEDIR_BASHUTILITIES}/modules/messages.sh";
. "${_SOURCEDIR_BASHUTILITIES}/modules/texttransform.sh";
. "${_SOURCEDIR_BASHUTILITIES}/modules/values.sh";
. "${_SOURCEDIR_BASHUTILITIES}/modules/git.sh";

. "${SOURCEDIR}bin/functions.sh";
. "${SOURCEDIR}bin/config.sh";
. "${SOURCEDIR}bin/create_file.sh";

theme_dir="${wpcontent_dir}/themes/${project_prefix}";

# Custom post type
if [[ $entity_type == 'c' ]]; then
    . "${SOURCEDIR}bin/register_post_type.sh";
    . "${SOURCEDIR}bin/add_taxometas.sh";
    . "${SOURCEDIR}bin/prevent_single.sh";
    . "${SOURCEDIR}bin/save_post_posttype.sh";
    . "${SOURCEDIR}bin/delete_post_posttype.sh";
    . "${SOURCEDIR}bin/add_strates_posttype.sh";
    . "${SOURCEDIR}bin/add_fixtures.sh";
    . "${SOURCEDIR}bin/add_to_blocks.sh";
    . "${SOURCEDIR}bin/create_entity.sh";
    . "${SOURCEDIR}bin/add_options.sh";
    . "${SOURCEDIR}bin/add_post_metas.sh";
    . "${SOURCEDIR}bin/add_meta_box.sh";
    . "${SOURCEDIR}bin/add_wpuseo.sh";
    . "${SOURCEDIR}bin/add_pll.sh";
    . "${SOURCEDIR}bin/add_filters.sh";
    . "${SOURCEDIR}bin/add_archive_acf_fields.sh";
    . "${SOURCEDIR}bin/add_admin_columns.sh";
    . "${SOURCEDIR}bin/add_thumbnails.sh";
    . "${SOURCEDIR}bin/add_widget.sh";
    . "${SOURCEDIR}bin/add_admin_widget.sh";
fi;

# Taxonomy
if [[ $entity_type == 't' ]]; then
    . "${SOURCEDIR}bin/register_taxo.sh";
    . "${SOURCEDIR}bin/create_tax.sh";
    . "${SOURCEDIR}bin/add_taxometas_tax.sh";
    . "${SOURCEDIR}bin/add_taxo_column.sh";
    . "${SOURCEDIR}bin/add_wpuseo_taxo.sh";
fi;

# Block
if [[ $entity_type == 'b' ]]; then
    . "${SOURCEDIR}bin/add_block_type.sh";
    . "${SOURCEDIR}bin/add_options.sh";
    . "${SOURCEDIR}bin/add_acf_options.sh";
fi;

# Page
if [[ $entity_type == 'p' ]]; then
    . "${SOURCEDIR}bin/add_page.sh";
    . "${SOURCEDIR}bin/hide_page.sh";
    . "${SOURCEDIR}bin/add_post_metas.sh";
    . "${SOURCEDIR}bin/add_contact_form.sh";
    . "${SOURCEDIR}bin/add_strates_page.sh";
    . "${SOURCEDIR}bin/create_page.sh";
fi;

. "${SOURCEDIR}bin/clean.sh";
. "${_SOURCEDIR_BASHUTILITIES}/modules/stop.sh";
