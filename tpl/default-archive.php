<?php
get_header();
?>
<div class="main-content main-content--entitypluralid">
    <h1><?php echo __( 'Archive', 'projectprefix' ); ?></h1>
    <div>
        <?php
        while (have_posts()) {
            the_post();
            the_title();
        }
        ?>
    </div>
</div>
<?php
get_footer();
