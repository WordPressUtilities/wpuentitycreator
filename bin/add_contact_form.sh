#!/bin/bash

###################################
## Add a contact form
###################################

read -p "Add a contact form ? (y/N) " add_contact_form;
if [[ $add_contact_form == 'y' ]]; then
    cat "${SOURCEDIR}inc/add_contact_form.php" >> "${mainfile}";
fi;
