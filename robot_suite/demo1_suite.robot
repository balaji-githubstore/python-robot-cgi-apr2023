*** Settings ***
Library     DateTime

*** Test Cases ***
TC1
    Log To Console  message=balaji dinakaran
    Log To Console    Welcome to robot session

TC2
    Log To Console    hello

TC3
    ${my_name}  Set Variable    robot framework session
    Log To Console    ${my_name}

TC4
    ${current_date}     Get Current Date
    Log To Console    ${current_date}

TC5
    ${radius}     Set Variable    18
    #caluclate area of cirle and print it.
    ${res}  Evaluate    3.14*${radius}*${radius}
    Log To Console  ${res}

