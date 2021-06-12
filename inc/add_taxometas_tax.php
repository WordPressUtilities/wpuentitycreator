<?php /* */

/* ----------------------------------------------------------
  Add taxonomy metas
---------------------------------------------------------- */

add_filter( 'wputaxometas_fields', 'projectprefix_entitypluralid_wputaxometas_fields' );
function projectprefix_entitypluralid_wputaxometas_fields( $fields ) {
    $fields['entitypluralid_description'] = array(
        'label' => 'Test field',
        'taxonomies' => array( 'entitypluralid' ),
        'description' => 'a long description',
        'type' => 'textarea'
    );
    return $fields;
}
