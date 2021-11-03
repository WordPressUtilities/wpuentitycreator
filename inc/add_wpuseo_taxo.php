<?php /* */

/* ----------------------------------------------------------
  Add taxo to WPU SEO
---------------------------------------------------------- */

add_filter('wpuseo_taxo_list', function ($tax) {
    $tax[] = 'entitypluralid';
    return $tax;
}, 10, 1);

// Disable lang on taxonomies if needed
// add_filter('wpuseo_enable_lang_on_taxos', '__return_false');

