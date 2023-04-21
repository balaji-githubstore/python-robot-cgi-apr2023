*** Settings ***
Library     OperatingSystem
Library    AppiumLibrary

*** Variables ***
${BROWSER_NAME}     chrome
@{COLORS}   red   green   yellow
&{MOBILE_DEVICE}    platformName=ios    platformVersion=11.0    deviceName=iPhone11


*** Keywords ***
Sub Number
    [Arguments]     ${a}       ${b}
    ${res}  Evaluate    ${a}-${b}
    [Return]  ${res}
    
*** Test Cases ***
TC1
    ${result}   Sub Number    10    20
    Log To Console    ${result}
    IF    ${result}>0
         Log To Console    Yes
    ELSE
        Log To Console    No
    END

TC2
    FOR    ${i}    IN RANGE    0    11
       Log To Console    ${i}
    END

TC3
    @{colors}   Create List   red   green   yellow  pink
    ${count}    Get Length    ${colors}
    FOR    ${i}    IN RANGE    0    ${count}
        Log To Console    ${colors}[${i}]
    END

TC4
    @{colors}   Create List   red   green   yellow  pink
    FOR    ${element}    IN    @{colors}
        Log To Console    ${element}
    END

TC5
    Set Local Variable    ${i}      1
    ${i}    Convert To Number    ${i}
    WHILE    ${i}<10
         Log To Console    ${i}
         ${i}  Evaluate     ${i}+1
    END

    #logic writing
TC6 
    ${list}     Run Keyword And Ignore Error    Click Element   xpath=//a
    Log To Console    ${list}
    WHILE    '${list}[0]'=='FAIL'
         Log To Console    try click
          ${list}     Run Keyword And Ignore Error    Click Element   xpath=//a
    END