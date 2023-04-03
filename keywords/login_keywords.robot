*** Settings ***
Resource    ../base/base_test.robot

*** Keywords ***

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${EMAIL_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    id:my-account-action-login

Verify Successful Login
    Click Element    ${MY_PROFILE_BUTTON}
    Wait Until Page Contains    ${REGISTERED_NAME}