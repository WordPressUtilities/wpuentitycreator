<?php /* */

add_filter('wpu_acf_flexible_content', 'projectprefix_entitypluralid_wpu_acf_flexible_content', 12, 1);
function projectprefix_entitypluralid_wpu_acf_flexible_content($contents) {
    /* Post type */
    $contents['entitypluralid-blocks'] = array(
        'post_types' => array(
            'entitypluralid'
        ),
        'name' => 'Content',
        'fields' => array(
            'logo' => array(
                'label' => 'Logo',
                'type' => 'image'
            ),
            'link' => array(
                'label' => 'Lien',
                'type' => 'url'
            )
        )
    );
    return $contents;
}
