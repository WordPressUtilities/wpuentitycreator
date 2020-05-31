<?php /* */

/* ----------------------------------------------------------
  Add a contact form
---------------------------------------------------------- */

add_filter('wpucontactforms_default_options', 'projectprefix_entitypluralid_wpucontactforms_default_options', 10, 1);
function projectprefix_entitypluralid_wpucontactforms_default_options($options) {

    $fields = array();

    $fields['contact_name'] = array(
        'label' => __('Name', 'wpucontactforms'),
        'required' => 1
    );
    $fields['contact_email'] = array(
        'label' => __('Email', 'wpucontactforms'),
        'type' => 'email',
        'required' => 1
    );
    $fields['contact_message'] = array(
        'label' => __('Message', 'wpucontactforms'),
        'type' => 'textarea',
        'required' => 1
    );
    $fields['contact_file'] = array(
        'label' => __('File', 'wpucontactforms'),
        'type' => 'file'
    );

    return array(
        'id' => 'entitypluralid-form',
        'name' => '[entitynameentity] Form',
        'contact__settings' => array(
            'group_class' => 'cssc-form cssc-form--default',
            'contact_fields' => $fields
        )
    );
}
