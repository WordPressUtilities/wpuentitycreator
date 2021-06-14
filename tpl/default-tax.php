<?php
$page_tax = get_queried_object();
get_header();
?>
<div class="main-content main-content--entitypluralid">
    <h1><?php echo $page_tax->name; ?></h1>
    <div>
<?php
echo '<ul>';
while (have_posts()): the_post();
    echo '<li>';
    echo '<a href="' . get_permalink() . '">';
    the_title();
    echo '</a>';
    echo '</li>';
endwhile;
echo '</ul>';
?>
    </div>
</div>
<?php
get_footer();
