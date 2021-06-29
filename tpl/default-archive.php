<?php
get_header();
$wpq_entitypluralid = new WP_Query(array(
    'posts_per_page' => -1,
    'post_type' => 'entitypluralid'
));
?>
<div class="centered-container cc-main-content--entitypluralid">
    <div class="main-content main-content--entitypluralid">
        <h1><?php echo __('entitynameentity', 'projectprefix'); ?></h1>
        <?php
        if ($wpq_entitypluralid->have_posts()) {
            echo '<div>';
            while ($wpq_entitypluralid->have_posts()) {
                $wpq_entitypluralid->the_post();
                echo '<div>';
                include get_stylesheet_directory() . '/tpl/loops/loop-entitypluralid.php';
                echo '</div>';
            }
            echo '</div>';
        }
        wp_reset_postdata();
        ?>
    </div>
</div>
<?php
get_footer();
