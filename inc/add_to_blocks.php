<?php /* */

/* ----------------------------------------------------------
  Add post type to master blocks
---------------------------------------------------------- */

add_filter('projectprefix_master_post_types', function ($pt) {
    $pt[] = 'entitypluralid';
    return $pt;
}, 10);
