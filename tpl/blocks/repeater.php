<?php /* */

/* ----------------------------------------------------------
  Block entitynameentity
---------------------------------------------------------- */

add_filter('projectprefix_blocks', function ($layouts) {
    $layouts['entityidentity'] = array(
        'label' => 'entitynameentity',
        'sub_fields' => array(
            'entityidentity' => array(
                'type' => 'repeater',
                'layout' => 'block',
                'sub_fields' => array(
                    'title' => 'wpuacf_title',
                    'text' => array(
                        'label' => 'Text',
                        'type' => 'textarea'
                    )
                )
            )
        )
    );
    return $layouts;
}, 10, 1);
