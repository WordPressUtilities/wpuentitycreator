#!/bin/bash

###################################
## Register taxonomy
###################################

read -p "Add taxonomy ${entity_pluralid}-type ? (y/N) " register_taxonomy;
if [[ $register_taxonomy == 'y' ]]; then
    cat "${SOURCEDIR}inc/register_taxonomy.php" >> "${mainfile}";
    read -p "Add taxonomy metas ? (y/N) " add_taxometas;
    if [[ $add_taxometas == 'y' ]]; then
        cat "${SOURCEDIR}inc/add_taxometas.php" >> "${mainfile}";
    fi;
    read -p "Add taxonomy to breadcrumbs for this post type ? (y/N) " add_taxo_breadcrumbs_post_type;
    if [[ $add_taxo_breadcrumbs_post_type == 'y' ]]; then
        cat "${SOURCEDIR}inc/add_taxo_breadcrumbs_post_type.php" >> "${mainfile}";
    fi;
fi;
