<?php /* */

/* ----------------------------------------------------------
  Prevent page visibility
---------------------------------------------------------- */

add_action('template_redirect', 'projectprefix_entitypluralid_prevent_visibility');
function projectprefix_entitypluralid_prevent_visibility() {
    if (is_page(entityidentityup__PAGE_ID)) {
        wp_redirect(site_url());
        die;
    }
}
