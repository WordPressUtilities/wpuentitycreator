#!/bin/bash

function wpuentitycreator_sed(){
    sed -i.bak "${1}" "${2}";
    rm "${2}.bak";
}

function extract_prefix(){
    tmp_prefix=$(echo "${1}" | tr '_' '\n' | head -1);
    echo ${tmp_prefix/\.\//};
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

