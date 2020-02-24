<?php /* */

/* ----------------------------------------------------------
  Post type
---------------------------------------------------------- */

add_filter('wpu_acf_flexible_content', 'projectprefix_entitypluralid_wpu_acf_flexible_content', 12, 1);
function projectprefix_entitypluralid_wpu_acf_flexible_content($contents) {
    /* Post type */
    $contents['entitypluralid-blocks'] = array(
        'post_types' => array(
            'entitypluralid'
        ),
        'name' => 'Content',
        'layouts' => array(
            'entitypluralid-basique' => array(
                'wpuacf_model' => 'content-classic'
            ),
            'entitypluralid-wysiwyg' => array(
                'wpuacf_model' => 'features'
            )
        )
    );
    return $contents;
}
