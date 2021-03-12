<?php /* */

/* ----------------------------------------------------------
  Add post type to Polylang
---------------------------------------------------------- */

add_filter('pll_get_post_types', function ($pt, $true) {
    $pt[] = 'entitypluralid';
    return $pt;
}, 10, 2);
