<?php /* */

/* ----------------------------------------------------------
  Register taxonomy
---------------------------------------------------------- */

add_filter('wputh_get_taxonomies', 'projectprefix_entitypluralid_set_taxonomies');
function projectprefix_entitypluralid_set_taxonomies($taxonomies) {
    $taxonomies['entitypluralid'] = array(
        'name' => __('entitynameentity', 'projectprefix'),
        'plural' => __('entitypluralentity', 'projectprefix'),
        'female' => 0,
        'post_type' => array('post')
    );
    return $taxonomies;
}

