#!/bin/bash

###################################
## Create file
###################################

touch "${mainfile}";

echo "<?php

/*
Plugin Name: [${project_prefix}] ${entity_plural}
Description: Handle ${entity_typename} ${entity_name}
*/" > "${mainfile}";
