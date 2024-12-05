#!/bin/bash

###################################
## Register taxonomy
###################################

register_taxonomy=$(bashutilities_get_yn "Add taxonomy ${entity_pluralid}-type ?" 'n');
if [[ $register_taxonomy == 'y' ]]; then
    cat "${SOURCEDIR}inc/register_taxonomy.php" >> "${mainfile}";
    add_taxometas=$(bashutilities_get_yn "Add taxonomy metas ?" 'n');
    if [[ $add_taxometas == 'y' ]]; then
        cat "${SOURCEDIR}inc/add_taxometas.php" >> "${mainfile}";
    fi;
    add_taxo_breadcrumbs_post_type=$(bashutilities_get_yn "Add taxonomy to breadcrumbs for this post type ?" 'n');
    if [[ $add_taxo_breadcrumbs_post_type == 'y' ]]; then
        cat "${SOURCEDIR}inc/add_taxo_breadcrumbs_post_type.php" >> "${mainfile}";
    fi;
fi;
