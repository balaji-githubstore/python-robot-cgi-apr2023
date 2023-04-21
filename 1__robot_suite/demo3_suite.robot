*** Settings ***
Library     String
Library    OperatingSystem
Library     demo.py

*** Test Cases ***
TC11
    ${res}  Add Number    4    6
    Log To Console    ${res}
TC1
    ${num1}     Set Variable     $162,700
    ${num2}     Set Variable     $161,700
    ${num1}     Remove String    ${num1}    $   ,
    ${num2}     Remove String    ${num1}    $   ,
    ${num1}    Convert To Integer     ${num1}
    ${total}    Evaluate    ${num1}+${num2}
    Log To Console    ${total}


TC2
    Log To Console    C:${/}Python_Robot_Training${/}demo_folder
    Log To Console    ${CURDIR}
    Log To Console    ${OUTPUT_DIR}
    Log To Console    ${EXECDIR}
    Log To Console    ${TEST_NAME}
    Log To Console    ${SUITE_NAME}
    Log To Console    balaji${SPACE}${SPACE}-trainer
    
    
TC3
    Create Directory    path=C:${/}Python_Robot_Training${/}demo_folder
    Directory Should Exist    path=C:${/}Python_Robot_Training${/}demo_folder

TC4
    Create File    path=C:${/}Python_Robot_Training${/}demo_folder${/}hello.txt     content=hello world
    File Should Exist    path=C:${/}Python_Robot_Training${/}demo_folder${/}hello.txt
    Remove File    path=C:${/}Python_Robot_Training${/}demo_folder${/}hello.txt
    File Should Not Exist    path=C:${/}Python_Robot_Training${/}demo_folder${/}hello.txt
    
TC5
    ${files}    List Files In Directory    path=C:${/}Automation Training${/}PythonSeleniumProject${/}python_concepts   
     Log To Console    ${files}
     Log    ${files}
     Log  ${files}[1]
    
