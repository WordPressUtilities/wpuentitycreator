<?php /* */

/* ----------------------------------------------------------
  Admin column
---------------------------------------------------------- */

add_filter('manage_edit-entitypluralid_columns', function ($columns) {
    $columns['entitypluralid_image'] = 'Image';
    return $columns;
});

add_action('manage_entitypluralid_custom_column', function ($content, $column_name, $term_id) {
    if ($column_name != 'entitypluralid_image') {
        return;
    }
    echo '<img src="https://via.placeholder.com/100x100" alt="" />';
}, 99, 3);
