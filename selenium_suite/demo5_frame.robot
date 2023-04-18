*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/
    #enter user id as jack123
    Select Frame    xpath=//frame[@name='login_page']
    Input Text    name=fldLoginUserId    john123
    Click Element    link=CONTINUE
    #switch to main html
    Unselect Frame

