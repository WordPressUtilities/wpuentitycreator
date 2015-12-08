<?php /* */

/* ----------------------------------------------------------
  Register taxonomy
---------------------------------------------------------- */

add_filter('wputh_get_taxonomies', 'projectprefix_entitypluralid_set_theme_taxonomies');
function projectprefix_entitypluralid_set_theme_taxonomies($taxonomies) {
    $taxonomies['entitypluralid-type'] = array(
        'name' => __( 'entitynameentity type', 'wputh' ),
        'post_type' => 'entitypluralid'
    );
    return $taxonomies;
}

