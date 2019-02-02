<?php

/* ----------------------------------------------------------
  Admin Widget
---------------------------------------------------------- */

add_action('wp_dashboard_setup', 'projectprefix_entitypluralid_add_dashboard_widgets');
function projectprefix_entitypluralid_add_dashboard_widgets() {
    wp_add_dashboard_widget(
        'projectprefix_entitypluralid_dashboard_widget',
        'entitynameentity',
        'projectprefix_entitypluralid_dashboard_widget__content'
    );
}

function projectprefix_entitypluralid_dashboard_widget__content() {
    echo "entitynameentity";
}
