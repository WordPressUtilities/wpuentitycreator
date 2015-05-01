<?php /* */

/* ----------------------------------------------------------
  Post metas
---------------------------------------------------------- */

/* Boxes
 -------------------------- */

add_filter('wputh_post_metas_boxes', 'projectprefix_entitypluralid_post_metas_boxes', 10, 3);
function projectprefix_entitypluralid_post_metas_boxes($boxes) {
    $boxes['entityidentity_details'] = array(
        'name' => 'Details',
        'post_type' => array(
            'entitypluralid'
        )
    );
    return $boxes;
}

/* Fields
 -------------------------- */

add_filter('wputh_post_metas_fields', 'projectprefix_entitypluralid_post_metas_fields', 10, 3);
function projectprefix_entitypluralid_post_metas_fields($fields) {

    #wputentitycreatorpostfields
    return $fields;
}
