*** Settings ***
Resource    ../base/base_test.robot

*** Variables ***

${NAVIGATION_LINKS}    //nav[@data-identifier='meta-navigation']//a

*** Keywords ***
Click on specified navigation link
    [Documentation]    Specify a navigation link as string to click on it.
    [Arguments]    ${navigation_link_to_click}
    ${NAVIGATION_LINKS}=    Get WebElements    ${NAVIGATION_LINKS}
    FOR    ${navigation_link}    IN    @{NAVIGATION_LINKS}
        ${navigation_link_text}=    Get Text    ${navigation_link}
        ${contains}=    Run Keyword And Return Status    Should Contain    ${navigation_link_text}   ${navigation_link_to_click}
        IF    ${contains}
            Click Element    ${navigation_link}
            BREAK
        END
    END