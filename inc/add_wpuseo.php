<?php /* */

/* ----------------------------------------------------------
  Add post type to WPU SEO
---------------------------------------------------------- */

add_filter('wpuseo_post_types', function ($pt) {
    $pt[] = 'entitypluralid';
    return $pt;
}, 10, 1);


add_filter('wpuseo_metasldjson_single_type', function ($name, $post_type) {
    if ($post_type == 'entitypluralid') {
        return 'entitynameentity';
    }
    return $name;
}, 10, 2);
