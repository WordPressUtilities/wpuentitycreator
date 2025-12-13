<?php /* */

/* ----------------------------------------------------------
  Add post type to WPU SEO
---------------------------------------------------------- */

add_filter('wpuseo_post_types', function ($pt) {
    $pt[] = 'entitypluralid';
    return $pt;
}, 10, 1);

/* JSON-LD type
-------------------------- */

add_filter('wpuseo_metasldjson_single_type', function ($name, $post_type) {
    if ($post_type == 'entitypluralid') {
        return 'entitynameentity';
    }
    return $name;
}, 10, 2);

/* Default desc
-------------------------- */

add_filter('wpuseo_post_description_main', function ($excerpt) {
    if (!is_singular('entitypluralid')) {
        return $excerpt;
    }
    $desc = get_post_meta(get_the_ID(), 'default_description_field', true);
    if ($desc) {
        return wp_strip_all_tags($desc);
    }
    return $excerpt;
}, 10, 2);
