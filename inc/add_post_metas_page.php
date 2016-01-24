<?php /* */

/* ----------------------------------------------------------
  Post metas
---------------------------------------------------------- */

/* Boxes
 -------------------------- */

add_filter('wputh_post_metas_boxes', 'projectprefix_entitypluralid_post_metas_boxes', 10, 3);
function projectprefix_entitypluralid_post_metas_boxes($boxes) {
    $boxes['entityidentity_details'] = array(
        'post_id' => entityidentityup__PAGE_ID,
        'name' => 'Details',
        'post_type' => array(
            'page'
        )
    );
    return $boxes;
}
