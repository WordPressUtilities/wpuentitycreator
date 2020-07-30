<?php /* */

/* ----------------------------------------------------------
  Save Post action
---------------------------------------------------------- */

add_action('save_post', 'projectprefix_entitypluralid_save_post', 20, 3);
function projectprefix_entitypluralid_save_post($post_id, $post, $update) {
    /* Only on this post type */
    if ('entitypluralid' !== $post->post_type) {
        return;
    }

    /* Avoid autosave */
    if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) {
        return;
    }

    /* Prevent user without rights */
    if (!current_user_can('edit_post', $post_id)) {
        return;
    }

    /* Only if not a revision */
    if (wp_is_post_revision($post_id)) {
        return;
    }

    /* Only if this is a new post! */
    if ($update) {
        return;
    }

    /* Only when saving from BO */
    if (empty($_POST)) {
        return;
    }

    /* Action */
}
