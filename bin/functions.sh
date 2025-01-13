#!/bin/bash

function wpuentitycreator_extract_prefix(){
    tmp_prefix=$(echo "${1}" | tr '_' '\n' | head -1);
    tmp_prefix=${tmp_prefix/\.php\//};
    tmp_prefix=${tmp_prefix/\.\//};
    tmp_prefix=${tmp_prefix/\*\//};
    echo "${tmp_prefix}"
}

function wpuentitycreator_replace_vars(){
    bashutilities_sed "s/entitynameentity/${entity_name}/g" "${1}";
    bashutilities_sed "s/entityidentity/${entity_id}/g" "${1}";
    bashutilities_sed "s/entitypluralid/${entity_pluralid}/g" "${1}";
    bashutilities_sed "s/entitypluralname/${entity_plural}/g" "${1}";
    bashutilities_sed "s/projectprefix/${project_prefix}/g" "${1}";
    bashutilities_sed "s/taxposttype/${tax_post_type}/g" "${1}";
}
