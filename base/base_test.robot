*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    ../resources/webdriver-helper.py

Resource    ../pages/home_page.robot
Resource    ../pages/login_page.robot
Resource    ../keywords/home_keywords.robot
Resource    ../keywords/login_keywords.robot
Resource    ../resources/common.robot
Resource    ../components/menu.robot

*** Variables ***
${BROWSERS}    ${EMPTY}

*** Keywords ***
Common Test Setup
    ${BROWSERS}=    Create List    Chrome    Firefox    Edge    Opera
    IF    $BROWSER == $BROWSERS[0]
        Setup Chrome
    END
    IF    $BROWSER == $BROWSERS[1]
        Setup Firefox
    END
    IF    $BROWSER == $BROWSERS[2]
        Setup Edge
    END
    IF    $BROWSER == $BROWSERS[3]
        Setup Opera
    END
    Go To    ${BASE_URL}

Setup Chrome
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --log-level\=3
    ${chrome_driver_path}=    Get Chrome Driver Path
    Create WebDriver    ${BROWSER}    executable_path=${chrome_driver_path}    chrome_options=${chrome_options}

Setup Firefox
    ${firefox_options} =    Evaluate    selenium.webdriver.FirefoxOptions()
    Call Method    ${firefox_options}    add_argument    --headless
    Call Method    ${firefox_options}    add_argument    --start-maximized
    ${firefox_driver_path}=    Get Firefox Driver Path
    Create WebDriver    ${BROWSER}    executable_path=${firefox_driver_path}    firefox_options=${firefox_options}

Setup Edge
    ${edge_options} =    Evaluate    selenium.webdriver.EdgeOptions()
    Call Method    ${edge_options}    add_argument    --headless
    Call Method    ${edge_options}    add_argument    --start-maximized
    ${edge_driver_path}=    Get Edge Driver Path
    Create WebDriver    ${BROWSER}    executable_path=${edge_driver_path}    edge_options=${edge_options}

Setup Opera
    ${opera_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${opera_options}    add_argument    --headless
    Call Method    ${opera_options}    add_argument    --start-maximized
    ${opera_driver_path}=    Get Opera Driver Path
    Create WebDriver    ${BROWSER}    executable_path=${opera_driver_path}    chrome_options=${opera_options}

Common Test Teardown 
    Close All Browsers
