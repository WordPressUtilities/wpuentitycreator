#!/bin/bash

###################################
## Test ACF Flex
###################################

_has_acf_flex='0';
if [[ -f "${wpcontent_dir}/plugins/advanced-custom-fields-pro/acf.php" ]];then
    _has_acf_flex='1';
fi;
