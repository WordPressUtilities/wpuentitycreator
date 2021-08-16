<?php /* */

/* ----------------------------------------------------------
  Block entitynameentity
---------------------------------------------------------- */

add_filter('projectprefix_blocks', function ($layouts) {
    $layouts['entityidentity'] = array(
        'label' => 'entitynameentity',
        'sub_fields' => array()
    );
    return $layouts;
}, 10, 1);
