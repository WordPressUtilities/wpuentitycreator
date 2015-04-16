<?php /* */

/* ----------------------------------------------------------
  Prevent single page
---------------------------------------------------------- */

add_action('template_redirect', 'projectprefix_entitypluralid_prevent_single');
function projectprefix_entitypluralid_prevent_single() {
    if (is_singular('entitypluralid')) {
        wp_redirect(get_post_type_archive_link('entitypluralid'));
        die;
    }
}
