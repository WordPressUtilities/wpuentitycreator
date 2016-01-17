<?php /* */

/* ----------------------------------------------------------
  Register taxonomy
---------------------------------------------------------- */

add_filter('wputh_get_taxonomies', 'projectprefix_entitypluralid_set_taxonomies');
function projectprefix_entitypluralid_set_taxonomies($taxonomies) {
    $taxonomies['entitypluralid-type'] = array(
        'name' => __( 'entitynameentity type', 'projectprefix' ),
        'post_type' => 'entitypluralid'
    );
    return $taxonomies;
}

