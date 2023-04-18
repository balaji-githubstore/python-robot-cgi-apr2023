*** Settings ***
Library    Collections

*** Variables ***
${BROWSER_NAME}     chrome
@{COLORS}   red   green   yellow
&{MOBILE_DEVICE}    platformName=ios    platformVersion=11.0    deviceName=iPhone11

*** Test Cases ***
TC1
    Log To Console    ${BROWSER_NAME}
    Log To Console    ${COLORS}
    Log To Console    ${COLORS}[0]
    Log  ${COLORS}

TC2
    Log To Console    ${MOBILE_DEVICE}
    Log To Console    ${MOBILE_DEVICE}[platformName]

TC3
    @{fruits}   Create List     mango   apple   grapes 
    Log To Console    ${fruits}
    Append To List      ${fruits}   pineapple
    Log To Console    ${fruits}
    #remove mango from list
    #insert mango at index 2
    #print the list
    #will start at 4:30 PM IST
