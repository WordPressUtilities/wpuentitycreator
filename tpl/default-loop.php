<?php

?><div class="loop-entityidentity">
    <div class="loop-entityidentity__image">
        <?php the_post_thumbnail('medium');?>
    </div>
    <div class="loop-entityidentity__content">
        <a href="<?php the_permalink();?>">
            <h3 class="loop-entityidentity__name"><?php the_title();?></h3>
        </a>
        <?php echo wputh_get_time_tag('d/m/Y', get_the_ID()); ?>
    </div>
</div><?php
