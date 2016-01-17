<?php /* */

/* ----------------------------------------------------------
  Widget
---------------------------------------------------------- */

add_action('widgets_init', 'projectprefix_entitypluralid_register_widgets');
function projectprefix_entitypluralid_register_widgets() {
    register_widget('projectprefix_entitypluralid');
}

class projectprefix_entitypluralid extends WP_Widget {
    function __construct() {
        parent::__construct(false, '[projectprefix] entitynameentity', array(
            'description' => 'entitynameentity'
        ));
    }
    function form($instance) {
    }
    function update($new_instance, $old_instance) {
        return $new_instance;
    }
    function widget($args, $instance) {
        echo $args['before_widget'];
        echo $args['before_title'] . __('entitynameentity', 'projectprefix') . $args['after_title'];

        /* Content */
        echo $args['after_widget'];
    }
}
