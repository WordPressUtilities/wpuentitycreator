<?php /* */

/* Fields
 -------------------------- */

add_filter('wputh_post_metas_fields', 'projectprefix_entitypluralid_post_metas_fields', 10, 3);
function projectprefix_entitypluralid_post_metas_fields($fields) {
#wputentitycreatorpostfields
    return $fields;
}
