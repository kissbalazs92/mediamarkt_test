*** Settings ***
Resource    ../base/base_test.robot

*** Variables ***
${first_name}=    ${EMPTY}
${last_name}=    ${EMPTY}
${email}=    ${EMPTY}
${rnd_username}=    ${EMPTY}
${rnd_password}=    ${EMPTY}
${phone}=    ${EMPTY}
${address}=    ${EMPTY}

*** Keywords ***
Generate random data for form
    ${rnd_first_name}=    Random First Name
    Set Global Variable    ${first_name}    ${rnd_first_name}
    ${rnd_last_name}=    Random Last Name
    Set Global Variable    ${last_name}    ${rnd_last_name}
    ${rnd_email}=    Random Email
    Set Global Variable    ${email}    ${rnd_email}
    ${rnd_rnd_username}=    Random Username
    Set Global Variable    ${rnd_username}    ${rnd_rnd_username}
    ${rnd_rnd_password}=    Random Password
    Set Global Variable    ${rnd_password}    ${rnd_rnd_password}
    ${rnd_phone}=    Random Phone Number
    Set Global Variable    ${phone}    ${rnd_phone}
    ${rnd_address}=    Random Address
    Set Global Variable    ${address}    ${rnd_address}

Fill Registration Form With Random Test Data
    Generate random data for form
    Input Text    ${FIRST_NAME_INPUT}    ${first_name}
    Input Text    ${LAST_NAME_INPUT}    ${last_name}
    Input Text    ${EMAIL_INPUT}    ${email}
    Input Text    ${USERNAME_INPUT_REG}    ${rnd_username}
    Input Text    ${PASSWORD_INPUT_REG}    ${rnd_password}
    Input Text    ${PHONE_INPUT}    ${phone}
    Input Text    ${ADDRESS_INPUT}    ${address}

Verify Successful Registration
    Connect To MySQL Database
    ${current_url} =    Get Location
    ${current_path} =    Get Url Path    ${current_url}
    Should Be Equal    ${current_path}    ${LOGIN_URL}
    Wait Until Page Contains    Sikeres regisztráció!
    ${result} =    Query    SELECT * FROM users WHERE username="${rnd_username}";
    Should Not Be Equal    ${result[0][2]}    ${rnd_password}
    Should Be Equal    ${result[0][3]}    ${first_name}
    Should Be Equal    ${result[0][4]}    ${last_name}
    Should Be Equal    ${result[0][5]}    ${email}
    Should Be Equal    ${result[0][6]}    ${phone}
    Should Be Equal    ${result[0][7]}    ${address}
    Should Be Equal As Numbers   ${result[0][8]}    0