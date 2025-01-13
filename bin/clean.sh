#!/bin/bash

###################################
## Replace site values
###################################

entity_id_up=`echo ${entity_id} | tr [:lower:] [:upper:]`;

bashutilities_sed "s/projectprefix/${project_prefix}/g" "${mainfile}";
bashutilities_sed "s/entityidentityup/${entity_id_up}/g" "${mainfile}";
bashutilities_sed "s/entityidentity/${entity_id}/g" "${mainfile}";
bashutilities_sed "s/entitynameentity/${entity_name}/g" "${mainfile}";
bashutilities_sed "s/entitypluralid/${entity_pluralid}/g" "${mainfile}";
bashutilities_sed "s/entitypluralentity/${entity_plural}/g" "${mainfile}";
bashutilities_sed "s/taxposttype/${tax_post_type}/g" "${mainfile}";

###################################
## Delete false PHP openings
###################################

bashutilities_sed 's/\<\?php \/\* \*\///g' "${mainfile}";
bashutilities_sed 's/<?php \/\* \*\///g' "${mainfile}";

###################################
## Add newlines where needed
###################################

bashutilities_sed 's/\/\*newline\*\//\'$'\n/g' "${mainfile}";

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
