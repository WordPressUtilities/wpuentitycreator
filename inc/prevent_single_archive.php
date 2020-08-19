<?php /* */

/* ----------------------------------------------------------
  Prevent single & archive page
---------------------------------------------------------- */

add_action('template_redirect', 'projectprefix_entitypluralid_prevent_single_archive');
function projectprefix_entitypluralid_prevent_single_archive() {
    if (is_singular('entitypluralid') || is_post_type_archive('entitypluralid')) {
        wp_redirect(site_url());
        die;
    }
}
