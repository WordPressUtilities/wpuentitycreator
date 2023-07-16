<?php /* */

/* ----------------------------------------------------------
  Add taxo to breadcrumbs before post type
---------------------------------------------------------- */

add_filter('wputh_get_breadcrumbs__before_singular__parent_tax', function ($tax, $post_type) {
    if ($post_type == 'entitypluralid') {
        return 'entitypluralid-type';
    }
    return $tax;
}, 10, 2);
