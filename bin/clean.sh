#!/bin/bash

###################################
## Replace site values
###################################

entity_id_up=`echo ${entity_id} | tr [:lower:] [:upper:]`;

wpuentitycreator_sed "s/projectprefix/${project_prefix}/g" "${mainfile}";
wpuentitycreator_sed "s/entityidentityup/${entity_id_up}/g" "${mainfile}";
wpuentitycreator_sed "s/entityidentity/${entity_id}/g" "${mainfile}";
wpuentitycreator_sed "s/entitynameentity/${entity_name}/g" "${mainfile}";
wpuentitycreator_sed "s/entitypluralid/${entity_pluralid}/g" "${mainfile}";
wpuentitycreator_sed "s/entitypluralentity/${entity_plural}/g" "${mainfile}";

###################################
## Delete false PHP openings
###################################

wpuentitycreator_sed 's/\<\?php \/\* \*\///g' "${mainfile}";
wpuentitycreator_sed 's/<?php \/\* \*\///g' "${mainfile}";

###################################
## Add newlines where needed
###################################

wpuentitycreator_sed 's/\/\*newline\*\//\'$'\n/g' "${mainfile}";

###################################
## Clean up multiple line breaks
###################################

mv "${mainfile}" "${mainfile}tmp";
sed -e '/./b' -e :n -e 'N;s/\n$//;tn' "${mainfile}tmp" > "${mainfile}";
rm "${mainfile}tmp";

###################################
## Flush cache
###################################

if [ "$(type -t wp)" = "file" ]; then
    wp rewrite flush;
    wp cache flush;
fi
