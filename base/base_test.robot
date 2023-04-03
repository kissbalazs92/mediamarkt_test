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

*** Keywords ***

Common Test Setup
    Open Browser    ${BASE_URL}    ${BROWSER}    options=add_experimental_option("excludeSwitches", ["enable-logging"])
Common Test Teardown 
    Close All Browsers
