#!/bin/bash

###################################
## Replace site values
###################################

entity_id_up=`echo ${entity_id} | tr [:lower:] [:upper:]`;

sed -i '' "s/projectprefix/${project_prefix}/g" "${mainfile}";
sed -i '' "s/entityidentityup/${entity_id_up}/g" "${mainfile}";
sed -i '' "s/entityidentity/${entity_id}/g" "${mainfile}";
sed -i '' "s/entitynameentity/${entity_name}/g" "${mainfile}";
sed -i '' "s/entitypluralid/${entity_pluralid}/g" "${mainfile}";
sed -i '' "s/entitypluralentity/${entity_plural}/g" "${mainfile}";

###################################
## Delete false PHP openings
###################################

sed -i '' 's/\<\?php \/\* \*\///g' "${mainfile}";

###################################
## Add newlines where needed
###################################

sed -i '' 's/\/\*newline\*\//\'$'\n/g' "${mainfile}";

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
