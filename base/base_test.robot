*** Settings ***
Library    SeleniumLibrary
Library    DatabaseLibrary
Library    Collections
Library    String
Library    ../resources/webdriver-helper.py
Library    ../resources/random_data_generator.py
Library    ../resources/url_helper.py

Resource    ../pages/home_page.robot
Resource    ../pages/login_page.robot
Resource    ../pages/admin_page.robot
Resource    ../pages/admin_dashboard_page.robot
Resource    ../pages/registration_page.robot

Resource    ../keywords/home_keywords.robot
Resource    ../keywords/login_keywords.robot
Resource    ../keywords/admin_keywords.robot
Resource    ../keywords/registration_keyword.robot

Resource    ../resources/common.robot

Resource    ../components/menu.robot

Variables    ../resources/common_variables.py

*** Variables ***
${BROWSERS}    ${EMPTY}

*** Keywords ***
Common Test Setup
    ${BROWSERS}=    Create List    Chrome    Firefox    Edge
    IF    $BROWSER == $BROWSERS[0]
        Setup Chrome
    END
    IF    $BROWSER == $BROWSERS[1]
        Setup Firefox
    END
    IF    $BROWSER == $BROWSERS[2]
        Setup Edge
    END
    Log    ${BROWSER}    console=${True}
    Go To    ${BASE_URL}

Setup Chrome
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --log-level\=3
    ${chrome_driver_path}=    Get Chrome Driver Path
    Create WebDriver    ${BROWSER}    executable_path=${chrome_driver_path}    chrome_options=${chrome_options}

Setup Firefox
    ${firefox_options} =    Evaluate    selenium.webdriver.FirefoxOptions()
    Call Method    ${firefox_options}    add_argument    --headless
    Call Method    ${firefox_options}    add_argument    --window-size\=1920,1080
    Call Method    ${firefox_options}    add_argument    --start-maximized
    ${LOG_PATH} =    Set Variable    ../results/geckodriver.log
    ${firefox_driver_path}=    Get Firefox Driver Path
    Create WebDriver    ${BROWSER}    executable_path=${firefox_driver_path}    options=${firefox_options}    log_path=${LOG_PATH}

Setup Edge
    ${edge_options} =    Evaluate    selenium.webdriver.EdgeOptions()
    Call Method    ${edge_options}    add_argument    --headless
    Call Method    ${edge_options}    add_argument    --start-maximized
    ${edge_driver_path}=    Get Edge Driver Path
    Create WebDriver    ${BROWSER}    executable_path=${edge_driver_path}    options=${edge_options}

Common Test Teardown 
    Close All Browsers
