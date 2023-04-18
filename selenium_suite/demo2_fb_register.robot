*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1 Register
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.facebook.com/
    Click Element    link=Create new account
    Input Text    name=firstname    john
    Input Text    name=lastname    wick
    Input Password    id=password_step_input    welcome123
    #dob - 16 Dec 2000
    Select From List By Label    id:day     20
    Select From List By Label    id=month   Dec
    #select year as 2000
    Select From List By Label    xpath=//select[@title='Year']      2000
    Click Element    xpath=//input[@value='-1']
    #click on sign up
    Click Element    name=websubmit
    
    