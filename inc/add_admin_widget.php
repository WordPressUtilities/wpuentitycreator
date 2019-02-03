<?php /* */

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
    $wpq_widget = new WP_Query(array(
        'posts_per_page' => 10,
        'order' => 'DESC',
        'post_type' => 'entitypluralid'
    ));
    if ($wpq_widget->have_posts()) {
        echo '<ul>';
        while ($wpq_widget->have_posts()) {
            $wpq_widget->the_post();
            echo '<li><a href="' . get_edit_post_link(get_the_ID()) . '">' . get_the_title() . '</a></li>';
        }
        echo '</ul>';
    }
    wp_reset_postdata();

}
