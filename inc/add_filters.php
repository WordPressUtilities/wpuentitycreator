<?php /* */

/* ----------------------------------------------------------
  Filters
---------------------------------------------------------- */

function projectprefix_entitypluralid_livesearch_get_datas() {
    $wpq_items = new WP_Query(array(
        'posts_per_page' => -1,
        'post_type' => 'entitypluralid'
    ));

    $datas = array();

    while ($wpq_items->have_posts()) {
        $wpq_items->the_post();

        /* HTML */
        ob_start();
        include get_stylesheet_directory() . '/tpl/loops/loop-entitypluralid.php';
        $out = ob_get_clean();

        /* Filter : type */
        $t_types = get_the_terms($id, 'entitypluralid-type');
        $types = array();
        foreach ($t_types as $type) {
            $types[] = $type->slug;
        }

        /* Store data */
        $datas[] = array(
            'html' => $out,
            'type' => $types,
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
        'view_all_label' => __('View all', 'vitality'),
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
?>
<div class="centered-container cc-main-content--entitypluralid">
    <div class="main-content main-content--entitypluralid">
        <h1><?php echo __('entitynameentity', 'projectprefix'); ?></h1>
        <?php do_action('wpulivesearch_form', $datas, $filters, $templates);?>
    </div>
</div>
<?php
get_footer();
*/
