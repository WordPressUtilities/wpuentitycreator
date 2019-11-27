<?php /* */

/* ----------------------------------------------------------
  Delete Post action
---------------------------------------------------------- */

add_action('wp_trash_post', 'projectprefix_entitypluralid_before_delete_post');
add_action('before_delete_post', 'projectprefix_entitypluralid_before_delete_post');
function projectprefix_entitypluralid_before_delete_post($post_id) {
    /* Only on our post type */
    $post_type = get_post_type($post_id);
    if ($post_type != 'entitypluralid') {
        return;
    }
    /* Action */
}

add_action('wp_trash_post', 'projectprefix_entitypluralid_after_delete_post');
add_action('after_delete_post', 'projectprefix_entitypluralid_after_delete_post');
function projectprefix_entitypluralid_after_delete_post($post_id) {
    /* Only on our post type */
    $post_type = get_post_type($post_id);
    if ($post_type != 'entitypluralid') {
        return;
    }
    /* Action */
}
