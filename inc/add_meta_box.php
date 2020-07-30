<?php /* */

/* ----------------------------------------------------------
  Meta box
---------------------------------------------------------- */

add_action('add_meta_boxes_entitypluralid', 'projectprefix_entitypluralid_meta_box');
function projectprefix_entitypluralid_meta_box() {
    add_meta_box(
        'projectprefix-entitypluralid',
        __('Meta Box', 'projectprefix'),
        'projectprefix_entitypluralid_meta_box_callback'
    );
}

function projectprefix_entitypluralid_meta_box_callback($post) {
    wp_nonce_field('projectprefix_entitypluralid_nonce', 'projectprefix_entitypluralid_nonce');
    $value = get_post_meta($post->ID, '_my_custom_post_type_field', true);
    echo '<label for="my_custom_post_type_field">' . __('My Custom Post Type Field : ', 'projectprefix') . '</label><br />';
    echo '<textarea style="width:100%" id="my_custom_post_type_field" name="my_custom_post_type_field">' . esc_attr($value) . '</textarea>';
}

add_action('save_post', 'save_projectprefix_entitypluralid_meta_box_data');
function save_projectprefix_entitypluralid_meta_box_data($post_id) {
    if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) {
        return;
    }

    if (!isset($_POST['my_custom_post_type_field']) || !isset($_POST['projectprefix_entitypluralid_nonce'])) {
        return;
    }

    if (!wp_verify_nonce($_POST['projectprefix_entitypluralid_nonce'], 'projectprefix_entitypluralid_nonce')) {
        return;
    }

    if (!current_user_can('edit_post', $post_id)) {
        return;
    }

    // Sanitize user input.
    $my_data = sanitize_text_field($_POST['my_custom_post_type_field']);

    // Update the meta field in the database.
    update_post_meta($post_id, '_my_custom_post_type_field', $my_data);
}
