*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    url=https://www.facebook.com/   browser=chrome
    ${actual_title}     Get Title
    Log To Console    ${actual_title}
    Close Browser

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    url=https://www.facebook.com/
    Input Text    id=email    hello12345@gmail.com
    Input Password    id=pass    welcome123
    #click on login
    Click Element    name=login
    Sleep    10s

TC3
    Open Browser    browser=chrome
    Set Selenium Implicit Wait    20s
    Maximize Browser Window
    Go To    url=https://www.facebook.com/
    #click on create new account
    Click Element    link=Create new account
    #enter firstname as john
    Input Text    name=firstname    john
    #lastname as peter
    #enter mobile number as 8978778
    #enter password as welcom123
    #dob -  16 Dec 2000
    #click on radio button custom
    #click on submit
