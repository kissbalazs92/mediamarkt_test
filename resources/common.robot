*** Settings ***
Resource    ../base/base_test.robot

*** Variables ***

${BROWSER}             Chrome
${BASE_URL}            https://www.mediamarkt.hu/
${LOGIN_URL}           https://www.mediamarkt.hu/webapp/wcs/stores/servlet/LogonForm
${USERNAME}            avemee7777@gmail.com
${PASSWORD}            mosoly77
${REGISTERED_NAME}     Balázs

*** Keywords ***

Go To Login Page
    Go To    ${LOGIN_URL}

Save Cookies
    ${all_cookies} =    Get Cookies    as_dict=${True}
    Set Suite Variable    ${SAVED_COOKIES}    ${all_cookies}
    #Log    Lememntett cookiek: ${SAVED_COOKIES}    console=${True}

Setup With Saved Cookies
    Click Element    ${ACCEPT_COOKIE_BUTTON}
    Delete All Cookies
    FOR    ${cookie_name}    IN    @{SAVED_COOKIES.keys()}
        ${cookie_value} =    Get From Dictionary    ${SAVED_COOKIES}    ${cookie_name}
        Add Cookie    ${cookie_name}    ${cookie_value}
    END
    ${asd}=    Get Cookies    as_dict=${True}
    #Log    Betöltött cookie-k: ${asd}    console=${True}

Switch To Tab
    [Arguments]    ${tab_index}
    ${window_ids} =    Get Window Handles
    Switch Window    ${window_ids}[${tab_index}]