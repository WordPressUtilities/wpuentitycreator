#!/bin/bash

function wpuentitycreator_sed(){
    sed -i.bak "${1}" "${2}";
    rm "${2}.bak";
}

function extract_prefix(){
    tmp_prefix=$(echo "${1}" | tr '_' '\n' | head -1);
    tmp_prefix=${tmp_prefix/\.php\//};
    tmp_prefix=${tmp_prefix/\.\//};
    tmp_prefix=${tmp_prefix/\*\//};
    echo "${tmp_prefix}"
}

function search_extract_file(){
    # Get first line containing the two items
    _variable=$(sed "/$1/,/$2/!d;/$2/q" $3);
    # Remove first part
    _variable=${_variable/$1/};
    # Remove last part
    _variable=${_variable/$2/};
    # Trim result
    _variable="$(echo -e "${_variable}" | tr '\n' ' ')";
    _variable="${_variable// /}";
    # Return result
    echo "${_variable}";
}

function wpuentitycreator_replace_vars(){
    wpuentitycreator_sed "s/entitynameentity/${entity_name}/g" "${1}";
    wpuentitycreator_sed "s/entityidentity/${entity_id}/g" "${1}";
    wpuentitycreator_sed "s/entitypluralid/${entity_pluralid}/g" "${1}";
    wpuentitycreator_sed "s/projectprefix/${project_prefix}/g" "${1}";
    wpuentitycreator_sed "s/taxposttype/${tax_post_type}/g" "${1}";
}
