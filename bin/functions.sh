#!/bin/bash

function wpuentitycreator_sed(){
    sed -i.bak "${1}" "${2}";
    rm "${2}.bak";
}
