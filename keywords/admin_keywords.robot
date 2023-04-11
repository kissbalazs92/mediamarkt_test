*** Settings ***
Resource    ../base/base_test.robot

*** Keywords ***

Login With Credentials As Admin
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${SUBMIT_BUTTON}

Verify Successful Login As Admin
    ${current_url} =    Get Location
    ${current_path} =    Get Url Path    ${current_url}
    Should Be Equal    ${current_path}    ${ADMIN_DASHBOARD_URL}
    Wait Until Page Contains    ${ADMIN}