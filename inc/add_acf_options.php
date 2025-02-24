<?php /* */

/* ----------------------------------------------------------
  Options
---------------------------------------------------------- */

add_filter('wpu_acf_flexible_content', function ($contents) {
    /* Page */
    $contents['entitypluralid-options'] = array(
        'name' => 'entitypluralentity',
        'location' => array(
            array(
                array(
                    'param' => 'options_page',
                    'operator' => '==',
                    'value' => 'projectprefix_entitypluralid'
                )
            )
        ),
        'fields' => array(
            'title' => 'wpuacf_title'
        )
    );
    return $contents;
}, 12, 1);

add_action('init', function () {
    if (!function_exists('acf_add_options_page')) {
        return;
    }
    acf_add_options_page(array(
        'page_title' => __('entitypluralentity', 'projectprefix'),
        'menu_slug' => 'projectprefix_entitypluralid',
        'menu_title' => __('entitypluralentity', 'projectprefix'),
        'capability' => 'edit_posts',
        'position' => '50',
        'parent_slug' => '',
        'icon_url' => 'dashicons-images-alt',
        'redirect' => true,
        'post_id' => 'projectprefix_entitypluralid',
        'autoload' => false,
        'update_button' => __('Update', 'projectprefix'),
        'updated_message' => __('Options Updated', 'projectprefix')
    ));
});

/* $title = get_field('title', 'projectprefix_entitypluralid'); */
