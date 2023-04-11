*** Settings ***
Resource    ../base/base_test.robot
Test Setup    Common Test Setup
Test Teardown    Common Test Teardown

*** Variables ***


*** Test Cases ***
Register new user
    Go To    ${BASE_URL}${REGISTRATION_URL}
    Fill Registration Form With Random Test Data
    Click Button    ${SUBMIT_BUTTON}
    Verify Successful Registration