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
    include get_stylesheet_directory() . '/tpl/loops/loop-entitypluralid.php';
    echo '</li>';
endwhile;
echo '</ul>';
?>
    </div>
</div>
<?php
get_footer();
