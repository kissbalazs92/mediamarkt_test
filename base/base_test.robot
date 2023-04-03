*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

Resource    ../pages/home_page.robot
Resource    ../pages/login_page.robot
Resource    ../keywords/home_keywords.robot
Resource    ../keywords/login_keywords.robot
Resource    ../resources/common.robot
Resource    ../components/menu.robot

*** Variables ***

${CHROMEDRIVER_PATH}    ..\drivers\chromedriver.exe

*** Keywords ***

Common Test Setup
    Open Browser    ${BASE_URL}    ${BROWSER}    executable_path=${chromedriver_path}
    Maximize Browser Window
Common Test Teardown 
    Close All Browsers
