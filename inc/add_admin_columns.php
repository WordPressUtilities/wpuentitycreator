<?php /* */

/* ----------------------------------------------------------
  Admin Columns
---------------------------------------------------------- */

add_filter('manage_entitypluralid_posts_columns', function ($columns) {
    return array_merge($columns, array(
        'column_id' => 'Column'
    ));
});

add_action('manage_entitypluralid_posts_custom_column', function ($column_key, $post_id) {
    if ($column_key == 'column_id') {
        echo get_post_meta($post_id, 'column_id', 1);
    }
}, 10, 2);
