<?php /* */

/* ----------------------------------------------------------
  Strates
---------------------------------------------------------- */

add_filter('wpu_acf_flexible_content', 'projectprefix_entitypluralid_wpu_acf_flexible_content', 12, 1);
function projectprefix_entitypluralid_wpu_acf_flexible_content($contents) {
    /* Page */
    $contents['entitypluralid-blocks'] = array(
        'page_ids' => array(
            get_option('entityidentity__page_id')
        ),
        'name' => 'Blocks',
        'layouts' => array(
            /* Basique */
            'basique' => array(
                'label' => 'Basique',
                'sub_fields' => array(
                    'title' => array(
                        'label' => 'Titre'
                    ),
                    'content' => array(
                        'label' => 'Contenu',
                        'type' => 'textarea'
                    ),
                    'link_url' => array(
                        'label' => 'URL Bouton',
                        'type' => 'url'
                    ),
                    'link_text' => array(
                        'label' => 'Texte Bouton'
                    )
                )
            ),
            /* Basique */
            'wysiwyg' => array(
                'label' => 'WYSIWYG',
                'sub_fields' => array(
                    'content' => array(
                        'label' => 'Contenu',
                        'type' => 'editor'
                    )
                )
            )
        )
    );
    return $contents;
}
