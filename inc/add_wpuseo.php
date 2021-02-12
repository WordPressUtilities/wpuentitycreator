<?php /* */

/* ----------------------------------------------------------
  Add post type to WPU SEO
---------------------------------------------------------- */

add_filter('wpuseo_post_types', function ($pt) {
    $pt[] = 'entitypluralid';
    return $pt;
}, 10, 1);
