<?php /* */

/* ----------------------------------------------------------
  Add ACF fields on archive
---------------------------------------------------------- */

add_filter('wpu_acf_flexible_content', function ($contents) {
    $contents['entitypluralid-archives-blocks'] = array(
        'location' => array(
            array(
                array(
                    'param' => 'post_type_list',
                    'operator' => '==',
                    'value' => 'entitypluralid'
                )
            )
        ),
        'style' => 'default',
        'name' => 'Header',
        'fields' => array(
            'title' => 'wpuacf_title'
        )
    );
    return $contents;
}, 12, 1);

/*
 * $main_title = get_field('title', 'entitypluralid_options');
 */
