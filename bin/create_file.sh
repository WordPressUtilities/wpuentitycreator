#!/bin/bash

###################################
## Create file
###################################

touch "${mainfile}";

if [[ "${entity_typename}" == 'empty' || "${entity_typename}" == 'block' ]];then
    echo "<?php
/*
Plugin Name: [${project_prefix}] ${entity_name}
Description: Handle ${entity_name}
*/" > "${mainfile}";

else
    echo "<?php
/*
Plugin Name: [${project_prefix}] ${entity_plural}
Description: Handle ${entity_typename} ${entity_name}
*/" > "${mainfile}";
fi;
