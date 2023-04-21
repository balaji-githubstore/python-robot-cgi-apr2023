*** Settings ***
Resource    ../resource/common_functionalities.resource


*** Test Cases ***
TC1 Check Present And Click
    Launch Browser And Navigate To Url
    ${count}    Get Element Count    xpath=//a[@class='newclose']
    #presence of element and clicking on it
    IF    ${count}>0
         Click Element    xpath=//a[@class='newclose']
    END

    Click Element    xpath=//a[@class='newclose2']

TC2
    Launch Browser And Navigate To Url
    Run Keyword And Ignore Error    Click Element    xpath=//j
    Run Keyword And Ignore Error    Click Element    xpath=//a[@class='newclose']
    Run Keyword And Ignore Error    Click Element    xpath=//a[@class='newclose2']

TC3
    Launch Browser And Navigate To Url
    Run Keyword And Ignore Error    Click Element    xpath=//a[@class='newclose']
    Run Keyword And Ignore Error    Click Element    xpath=//a[@class='newclose2']
    Click Element    xpath=//span[normalize-space()='Login']
    Switch Window   Citibank India
    Click Element    xpath=//*[contains(text(),'Forgot User')]
    Click Element    link=select your product type
    Click Element    partial link=Credit Card
    Input Text    css=#citiCard1    8989
    Input Text    id=citiCard2    8989
#    Input Text    id=bill-date-long    14/08/2000
    Execute Javascript      document.querySelector("#bill-date-long").value='14/09/2000'
    Click Element    name=agree
    Sleep    5s

TC4
    Launch Browser And Navigate To Url
    Run Keyword And Ignore Error    Click Element    xpath=//a[@class='newclose']
    Run Keyword And Ignore Error    Click Element    xpath=//a[@class='newclose2']
    Click Element    xpath=//span[normalize-space()='Login']
    Switch Window   Citibank India
    Click Element    xpath=//*[contains(text(),'Forgot User')]
    Click Element    link=select your product type
    Click Element    partial link=Credit Card
    Input Text    css=#citiCard1    8989
    Input Text    id=citiCard2    8989
#    Input Text    id=bill-date-long    14/08/2000
    ${ele}      Get WebElement  xpath=//input[@id='bill-date-long']
    Execute Javascript      arguments[0].value='14/09/2000'     ARGUMENTS       ${ele}
    Click Element    name=agree
    Sleep    5s