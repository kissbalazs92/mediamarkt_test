*** Settings ***
Resource    ../base/base_test.robot

*** Variables ***

${SAVED_COOKIES}    ${EMPTY}
${SAVED_COOKIES_ADMIN}    ${EMPTY}

*** Keywords ***

Save Cookies
    [Arguments]    ${is_admin}
    IF    $is_admin
        ${all_cookies} =    Get Cookies    as_dict=${True}
        Set Global Variable    ${SAVED_COOKIES_ADMIN}    ${all_cookies}
    ELSE
        ${all_cookies} =    Get Cookies    as_dict=${True}
        Set Global Variable    ${SAVED_COOKIES}    ${all_cookies}
    END
    Log    Lementett admin cookiek: ${SAVED_COOKIES_ADMIN}    console=${True}
    Log    Lementett user cookiek: ${SAVED_COOKIES}    console=${True}

Setup With Saved Cookies
    [Arguments]    ${is_admin}
    Delete All Cookies
    IF    $is_admin
        FOR    ${cookie_name}    IN    @{SAVED_COOKIES_ADMIN.keys()}
            ${cookie_value} =    Get From Dictionary    ${SAVED_COOKIES_ADMIN}    ${cookie_name}
            Add Cookie    ${cookie_name}    ${cookie_value}
        END
    ELSE
        FOR    ${cookie_name}    IN    @{SAVED_COOKIES.keys()}
            ${cookie_value} =    Get From Dictionary    ${SAVED_COOKIES}    ${cookie_name}
            Add Cookie    ${cookie_name}    ${cookie_value}
        END
    END
    ${asd}=    Get Cookies    as_dict=${True}
    Log    Betöltött cookie-k: ${asd}    console=${True}

Switch To Tab
    [Arguments]    ${tab_index}
    ${window_ids} =    Get Window Handles
    Switch Window    ${window_ids}[${tab_index}]

Connect To MySQL Database
    ${DB_NAME}    Set Variable    webshop
    ${DB_USER}    Set Variable    webshop_user
    ${DB_PASSWORD}    Set Variable    webshop_password
    ${DB_HOST}    Set Variable    web_application-db-1    
    ${DB_PORT}    Set Variable    3308
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}


