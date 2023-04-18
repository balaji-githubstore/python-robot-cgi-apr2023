*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.db4free.net/
    #click on phpMyAdmin »
    #//b[contains(text(),'phpMy')]
    Click Element    partial link=phpMyAd
    #switch window using title
    Switch Window   phpMyAdmin
    Input Text    locator=id:input_username    text=hello
    Input Password    id=input_password    welcome123
    Click Element    id=input_go
    Element Should Contain    id=pma_errors    Access denied for user12234
    #teardown keywords executed always
    [Teardown]     Run Keywords     Close Browser   AND   Log    Test Completed


TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.db4free.net/
    Click Element    partial link=phpMyAd
    Log Title
    Switch Window   NEW
    Input Text    locator=id:input_username    text=hello
    Log Title
    Switch Window   MAIN
    Log Title


