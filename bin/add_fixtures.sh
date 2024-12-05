#!/bin/bash

###################################
## Add fixtures
###################################

add_fixtures=$(bashutilities_get_yn "Add fixtures ?" 'n');
if [[ "${add_fixtures}" == 'y' ]]; then
    _fixtures_dir="${wpcontent_dir}/fixtures";
    _fixtures_file="${_fixtures_dir}/${entity_pluralid}.csv";
    if [[ ! -d "${_fixtures_dir}" ]];then
        mkdir "${_fixtures_dir}";
        echo 'deny from all' > "${_fixtures_dir}/.htaccess";
    fi;
    cat "${SOURCEDIR}tpl/default-fixtures.csv" > "${_fixtures_file}";
    wpuentitycreator_sed "s/entitynameentity/${entity_name}/g" "${_fixtures_file}";
    wpuentitycreator_sed "s/entitypluralid/${entity_pluralid}/g" "${_fixtures_file}";
    echo "- Fixtures created : ${_fixtures_file}";
fi;

