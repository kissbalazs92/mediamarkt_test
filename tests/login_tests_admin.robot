*** Settings ***
Resource    ../base/base_test.robot
Test Setup    Common Test Setup
Test Teardown    Common Test Teardown

*** Test Cases ***
Login to webshop as admin
    [Documentation]    Tests the login functionality as admin.
    [Tags]    high_priority    functional_test
    Go To    ${BASE_URL}${ADMIN_URL}
    Login With Credentials    ${ADMIN}    ${ADMIN_PASSWORD}
    Verify Successful Login As Admin
    Save Cookies    ${True}