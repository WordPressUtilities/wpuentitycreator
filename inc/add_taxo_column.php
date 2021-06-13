<?php /* */

/* ----------------------------------------------------------
  Admin column
---------------------------------------------------------- */

add_filter('manage_edit-entitypluralid_columns', function ($columns) {
    $columns['entitypluralid_cover'] = 'Image';
    return $columns;
});

add_filter('manage_entitypluralid_custom_column', function ($content, $column_name, $term_id) {
    if ($column_name == 'entitypluralid_cover') {
        echo '<img src="https://via.placehold.com/100x100" alt="" />';
    }
    return $content;
}, 99, 3);
