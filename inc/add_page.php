<?php /* */

/* ----------------------------------------------------------
  Add Page
---------------------------------------------------------- */

add_filter('wputh_pages_site', 'projectprefix_entitypluralid_wputh_set_pages_site');
function projectprefix_entitypluralid_wputh_set_pages_site($pages_site) {
    $pages_site['entityidentity__page_id'] = array(
        'post_title' => 'entitynameentity',
        'page_template' => "page-entityidentity.php",
        'post_content' => '<p>Content</p>',
        'disable_items' => array()
    );
    return $pages_site;
}
