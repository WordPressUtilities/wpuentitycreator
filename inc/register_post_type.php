<?php /* */

/* ----------------------------------------------------------
  Register post type
---------------------------------------------------------- */

add_filter('wputh_get_posttypes', 'projectprefix_entitypluralid_set_posttypes');
function projectprefix_entitypluralid_set_posttypes($post_types) {
    $post_types['entitypluralid'] = array(
        'menu_icon' => 'dashicons-portfolio',
        'name' => __('entitynameentity', 'projectprefix') ,
        'plural' => __('entitypluralentity', 'projectprefix') ,
        'female' => 0,
        'wputh__hide_singular' => wpuentitycreator_hide_singular,
        'has_archive' => wpuentitycreator_has_archive,
        'supports' => array(
            'title',
            'editor',
            'thumbnail'
        )
    );
    return $post_types;
}

