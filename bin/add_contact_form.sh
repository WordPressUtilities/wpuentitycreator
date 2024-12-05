#!/bin/bash

###################################
## Add a contact form
###################################

add_contact_form=$(bashutilities_get_yn "Add a contact form ?" 'n');
if [[ $add_contact_form == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_contact_form.php" >> "${mainfile}";
fi;
