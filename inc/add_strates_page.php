<?php /* */

add_filter('wpu_acf_flexible_content', 'projectprefix_entitypluralid_wpu_acf_flexible_content', 12, 1);
function projectprefix_entitypluralid_wpu_acf_flexible_content($contents) {
    /* Page */
    $contents['entitypluralid-blocks'] = array(
        'page_ids' => array(
            get_option('entityidentity__page_id')
        ),
        'name' => 'Blocks',
        'fields' => array(
            'content' => array(
                'label' => 'Contenu',
                'type' => 'textarea'
            )
        )
    );
    return $contents;
}
