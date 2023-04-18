*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Launch Browser And Navigate To Url
    [Arguments]    ${browser}       ${url}
    Open Browser    browser=${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=${url}

*** Test Cases ***
TC1 Upload File
    Launch Browser And Navigate To Url    browser=chrome    url=https://smallpdf.com/pdf-to-word
    Choose File    xpath=//input[@type='file']    C:${/}Mine${/}Balaji-Profile_2023_1.pdf
    Sleep    5s

TC2 Mouse Activity
    Launch Browser And Navigate To Url    browser=chrome    url=https://nasscom.in/
    #element should be present and visble to click
    Mouse Over    xpath=//a[text()='Membership']
    Click Element    xpath=//a[text()='Members Listing']

TC3
    Launch Browser And Navigate To Url    browser=chrome    url=https://www.malaysiaairlines.com/my/en/home.html
    Sleep    5s
    Click Element    xpath=//div[contains(@class,'AirportPicker-from')]/div/input
    Input Text    xpath=//div[contains(@class,'AirportPicker-from')]/div/input    MAA
    Press Keys      None     ENTER
    Input Text    xpath=(//div[contains(@class,'multiselect multiselect-main')]/div/input)    KUL
    Press Keys      None     ENTER
    Capture Page Screenshot

TC4
    Open Browser    browser=chrome      options=add_argument("--disable-notifications")
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Set Selenium Speed    1s
    Go To    url=https://www.redbus.in/
    
    Input Text    id=src    koyam
    Press Keys      None     ENTER
    Input Text    id=dest    madi
    Press Keys      None     ENTER
    Capture Page Screenshot