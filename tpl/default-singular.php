<?php
get_header();
the_post();
?>
<div class="main-content main-content--entityidentity">
    <h1><?php the_title(); ?></h1>
    <div>
        <?php the_content(); ?>
    </div>
</div>
<?php
get_footer();
