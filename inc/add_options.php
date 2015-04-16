<?php /* */

/* ----------------------------------------------------------
  Options
---------------------------------------------------------- */

add_filter('wpu_options_boxes', 'projectprefix_entitypluralid_set_wpu_options_boxes', 1, 3);
function projectprefix_entitypluralid_set_wpu_options_boxes($boxes) {
    $boxes['projectprefix_entitypluralid_box'] = array(
        'name' => 'Options entitypluralid'
    );
    return $boxes;
}

add_filter('wpu_options_fields', 'projectprefix_entitypluralid_set_wpu_options_fields', 10, 3);
function projectprefix_entitypluralid_set_wpu_options_fields($options) {
    $options['entitypluralid_text_description'] = array(
        'label' => __('Description talents', 'wputh') ,
        'box' => 'projectprefix_entitypluralid_box',
        'type' => 'editor'
    );
    return $options;
}
