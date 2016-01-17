<?php /* */

/* ----------------------------------------------------------
  Options
---------------------------------------------------------- */

add_filter('wpu_options_tabs', 'projectprefix_entitypluralid_set_wpu_options_tabs', 10, 1);
function projectprefix_entitypluralid_set_wpu_options_tabs($tabs) {
    $tabs['projectprefix_entitypluralid_tab'] = array(
        'name' => '[projectprefix] entitypluralentity'
    );
    return $tabs;
}

add_filter('wpu_options_boxes', 'projectprefix_entitypluralid_set_wpu_options_boxes', 1, 1);
function projectprefix_entitypluralid_set_wpu_options_boxes($boxes) {
    $boxes['projectprefix_entitypluralid_box'] = array(
        'name' => __('Options', 'projectprefix'),
        'tab' => 'projectprefix_entitypluralid_tab'
    );
    return $boxes;
}

add_filter('wpu_options_fields', 'projectprefix_entitypluralid_set_wpu_options_fields', 10, 1);
function projectprefix_entitypluralid_set_wpu_options_fields($options) {
    $options['entitypluralid_text_description'] = array(
        'label' => __('Description', 'projectprefix') ,
        'box' => 'projectprefix_entitypluralid_box',
        'type' => 'editor'
    );
    return $options;
}
