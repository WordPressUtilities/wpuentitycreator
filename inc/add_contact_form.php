<?php /* */

/* ----------------------------------------------------------
  Add a contact form
---------------------------------------------------------- */

add_filter('plugins_loaded', 'projectprefix_entitypluralid_init_contact_form', 10, 1);
function projectprefix_entitypluralid_init_contact_form($options) {

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

    if(!class_exists('wpucontactforms')){
        return;
    }

    new wpucontactforms(array(
        'id' => 'entitypluralid-form',
        'name' => '[entitynameentity] Form',
        'contact__settings' => array(
            'group_class' => 'cssc-form cssc-form--default',
            'contact_fields' => $fields
        )
    ));

}
