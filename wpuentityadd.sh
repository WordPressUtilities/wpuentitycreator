#!/bin/bash

echo '####';
echo '#### WPU Entity Add';
echo '#### v 0.40.1';
echo '####';
echo '';

###################################
## Config
###################################

MAINDIR="${PWD}/";
SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";

if [[ ! -f "${1}" ]];then
    echo 'no valid file defined';
    return 0;
fi;

_wpcontentdir=$(pwd);
wpcontent_dir=$(echo "${_wpcontentdir%/mu-plugins*}");

. "${SOURCEDIR}bin/functions.sh";
. "${SOURCEDIR}bin/detect.sh";

###################################
## Set values
###################################

mainfile="${1}";
project_prefix=$(basename "${mainfile}");
project_prefix=${project_prefix%_*};

# Check if post type
_has_post_type=$(search_extract_file "\$post_types\[\'" "\'\] \= array(" "${mainfile}")
_has_page=$(search_extract_file "\$pages_site\[\'" "__page_id\'\] = array(" "${mainfile}");

if [[ "${_has_post_type}" ]];then
    entity_typename='entity';
    entity_type='c';
    entity_pluralid=${_has_post_type};
    entity_id=${_has_post_type};
    entity_name=$(search_extract_file "'name' => __('" "', '${project_prefix}')," "${mainfile}")
    entity_plural=$(search_extract_file "'plural' => __('" "', '${project_prefix}')," "${mainfile}")
fi;

if [[ "${_has_page}" ]];then
    entity_typename='page';
    entity_type='p';
    entity_pluralid="${_has_page}";
    entity_id="${_has_page}";
    entity_name=$(search_extract_file "'post_title' => '" "'," "${mainfile}");
    entity_plural="${entity_name}";
fi;

# Page
if [[ $entity_type == 'p' ]]; then
    . "${SOURCEDIR}bin/add_post_metas.sh";
    . "${SOURCEDIR}bin/add_strates_page.sh";
    . "${SOURCEDIR}bin/clean.sh";
fi;

# Custom post type
if [[ $entity_type == 'c' ]]; then
    . "${SOURCEDIR}bin/add_options.sh";
    . "${SOURCEDIR}bin/add_taxometas.sh";
    . "${SOURCEDIR}bin/add_post_metas.sh";
    . "${SOURCEDIR}bin/add_meta_box.sh";
    . "${SOURCEDIR}bin/add_wpuseo.sh";
    . "${SOURCEDIR}bin/add_pll.sh";
    . "${SOURCEDIR}bin/add_to_blocks.sh";
    . "${SOURCEDIR}bin/add_filters.sh";
    . "${SOURCEDIR}bin/add_archive_acf_fields.sh";
    . "${SOURCEDIR}bin/add_admin_columns.sh";
    . "${SOURCEDIR}bin/add_fixtures.sh";
    . "${SOURCEDIR}bin/clean.sh";
fi;


