<?php /* */

/* ----------------------------------------------------------
  Thumbnails
---------------------------------------------------------- */

add_filter('wpu_thumbnails_sizes', 'projectprefix_entitypluralid_thumbnails_sizes');
function projectprefix_entitypluralid_thumbnails_sizes($sizes) {
    $sizes['entitypluralid-thumb'] = array(
        'w' => 10,
        'h' => 10,

        // Boolean (not required : Default to false)
        'crop' => true,

        // String (not required : Default to ID)
        'name' => 'entitynameentity thumb',

        // Array (not required : Default to array('any'))
        'post_type' => array(
            'entitypluralid'
        ) ,

        // Boolean (not required : Default to true)
        'display_gallery_insert' => false,
    );
    return $sizes;
}
