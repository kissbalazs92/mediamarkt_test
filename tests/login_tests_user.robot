*** Settings ***
Resource    ../base/base_test.robot
Test Setup    Common Test Setup
Test Teardown    Common Test Teardown

*** Variables ***


*** Test Cases ***

#Lokál futtatáshoz parancs: robot -d results -v BROWSER:Chrome -V ./resources/common_variables.py tests
#A {browser} Chrome, Firefox, Edge értékekkel működik
Login to webshop as simple user
    [Documentation]    Tests the login functionality as simple user.
    [Tags]    high_priority    functional_test
    Go To    ${BASE_URL}${LOGIN_URL}
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Verify Successful Login
    Save Cookies    ${False}
