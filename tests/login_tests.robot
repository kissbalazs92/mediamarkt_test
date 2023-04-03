*** Settings ***
Resource    ../base/base_test.robot
Test Setup    Common Test Setup
Test Teardown    Common Test Teardown

*** Variables ***


*** Test Cases ***
Login to Medimarkt webshop
    [Documentation]    Tests the login functionality.
    [Tags]    high_priority    functional_test
    Click Element    ${ACCEPT_COOKIE_BUTTON}
    Go To Login Page
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Verify Successful Login
    Save Cookies

Go to user settings
    Setup With Saved Cookies
    Go To Login Page
    Click Element    ${MY_PROFILE_BUTTON}
    Click Element    ${PERSONAL_DATA_OPTION}
    Page Should Contain    Jelszó megváltoztatása

Click on Karrier navigation link
    Click Element    ${ACCEPT_COOKIE_BUTTON}
    Click on specified navigation link    Karrier
    Switch To Tab    1
    Location Should Contain    https://careers.mediamarktsaturn.com/
