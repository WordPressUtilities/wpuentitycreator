#!/bin/bash

###################################
## Register taxonomy
###################################

cat "${SOURCEDIR}inc/register_taxo.php" >> "${mainfile}";
wpuentitycreator_replace_vars "${mainfile}";
