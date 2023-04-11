*** Settings ***
Resource    ../base/base_test.robot

*** Variables ***
${REGISTRATION_URL}    /registration.php
${FIRST_NAME_INPUT}    id:first_name
${LAST_NAME_INPUT}    id:last_name
${EMAIL_INPUT}    id:email
${USERNAME_INPUT_REG}    id:username
${PASSWORD_INPUT_REG}    id:password
${PHONE_INPUT}    id:phone
${ADDRESS_INPUT}    id:address
${SUBMIT_BUTTON}    //button[@type='submit']