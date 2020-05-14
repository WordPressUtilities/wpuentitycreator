<?php /* */

/* ----------------------------------------------------------
  Strates
---------------------------------------------------------- */

add_filter('wpu_acf_flexible_content', 'projectprefix_entitypluralid_wpu_acf_flexible_content', 12, 1);
function projectprefix_entitypluralid_wpu_acf_flexible_content($contents) {
    /* Page */
    $contents['entitypluralid-blocks'] = array(
        'page_templates' => array(
            'page-entityidentity.php'
        ),
        'name' => 'Blocks',
        'layouts' => array(
            'page-entitypluralid-basique' => array(
                'wpuacf_model' => 'content-classic'
            ),
            'page-entitypluralid-wysiwyg' => array(
                'wpuacf_model' => 'features'
            )
        )
    );
    return $contents;
}
