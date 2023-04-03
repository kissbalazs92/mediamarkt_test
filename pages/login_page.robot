*** Settings ***
Resource    ../base/base_test.robot

*** Variables ***

${MY_PROFILE_BUTTON}    //button[@data-identifier='MyProfile-button']
${PERSONAL_DATA_OPTION}    //a[@data-tracking='szemelyes_adatok']
${EMAIL_INPUT}    id:login-email
${PASSWORD_INPUT}    id:login-password