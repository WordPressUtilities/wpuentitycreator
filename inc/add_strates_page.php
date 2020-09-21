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

add_filter('wpu_acf_flexible__master_generator__layout_id',function ($content){
    return 'entitypluralid-blocks';
},10,1);

add_action('wpu_acf_flexible__master_generator__after_insert_post',function ($post_id){
    update_post_meta($post_id, '_wp_page_template', 'page-entityidentity.php');
},10,1);
