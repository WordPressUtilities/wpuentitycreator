<?php /* */

/* ----------------------------------------------------------
  Block entitynameentity
---------------------------------------------------------- */

add_filter('projectprefix_blocks', function ($layouts) {
    $layouts['entityidentity'] = array(
        'label' => 'entitynameentity',
        'sub_fields' => array(
            'title' => 'wpuacf_title',
            'link' => 'wpuacf_cta',
            'image' => array(
                'label' => 'Image',
                'type' => 'wpuacf_image'
            )
        )
    );
    return $layouts;
}, 10, 1);
