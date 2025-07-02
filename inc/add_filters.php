<?php /* */

/* ----------------------------------------------------------
  Filters
---------------------------------------------------------- */

function projectprefix_entitypluralid_livesearch_get_datas() {
    $q = wpulivesearch_get_query_for_post_type('entitypluralid', array(
        // 'filter_taxonomy_pages' => array('entitypluralid-type')
    ));
    $wpq_items = new WP_Query($q);

    /* Preload thumbnails */
    $post_ids = wp_list_pluck($wpq_items->posts, 'ID');
    wpulivesearch_preload_thumbnail_cache($post_ids);

    $datas = array();

    while ($wpq_items->have_posts()) {
        $wpq_items->the_post();

        /* Store data */
        $datas[] = array(
            'html' => wpulivesearch_get_template_html(get_stylesheet_directory() . '/tpl/loops/loop-entitypluralid.php'),
            'type' => wpulivesearch_get_terms_for_post('entitypluralid-type'),
            'name' => get_the_title()
        );
    }
    wp_reset_postdata();

    return $datas;
}

function projectprefix_entitypluralid_livesearch_get_filters() {
    $filters = array();
    $filters['type'] = array(
        'input_type' => 'radio',
        'taxonomy' => 'entitypluralid-type',
        'label' => 'Type',
        'view_all_label' => __('View all', 'projectprefix'),
        'hide_empty' => true,
        'has_view_all' => true,
        'value_field' => 'slug'
    );
    return $filters;
}

function projectprefix_entitypluralid_livesearch_get_templates() {
    $templates = array(
        'before' => '<ul data-livepagenb="{{page_nb}}" class="my-custom-results">',
        'item' => '<li class="wpulivesearch-item">{{html}}</li>',
        'after' => '</ul>'
    );
    return $templates;
}

/*
<?php
$datas = projectprefix_entitypluralid_livesearch_get_datas();
$filters = projectprefix_entitypluralid_livesearch_get_filters();
$templates = projectprefix_entitypluralid_livesearch_get_templates();
get_header();
echo '<div class="centered-container cc-main-content--entitypluralid">';
echo '<div class="main-content main-content--entitypluralid">';
echo '<h1>' . __('entitynameentity', 'projectprefix') . '</h1>';
do_action('wpulivesearch_form', $datas, $filters, $templates);
echo '</div>';
echo '</div>';
get_footer();
*/
