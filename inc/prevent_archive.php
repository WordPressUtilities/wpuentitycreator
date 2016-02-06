<?php /* */

/* ----------------------------------------------------------
  Prevent Archive
---------------------------------------------------------- */

add_action('template_redirect', 'projectprefix_entitypluralid_prevent_archive');
function projectprefix_entitypluralid_prevent_archive() {
    if (is_post_type_archive('entitypluralid')) {
        wp_redirect(site_url());
        die;
    }
}
