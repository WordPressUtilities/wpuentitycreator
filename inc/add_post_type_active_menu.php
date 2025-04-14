<?php /* */

/* ----------------------------------------------------------
  Menu
---------------------------------------------------------- */

add_filter('nav_menu_css_class', function ($classes, $item) {
    if ($item->type == 'post_type_archive' && $item->object == 'entitypluralid' && is_singular('entitypluralid')) {
        $classes[] = 'current-menu-item';
    }

    return $classes;
}, 10, 2);
