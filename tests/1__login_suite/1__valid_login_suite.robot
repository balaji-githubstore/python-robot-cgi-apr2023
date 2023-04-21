*** Settings ***
Documentation   This suite handles valid login of orange HRM
...     connected to story rdp-003

Resource    ../../resource/base/CommonFunctionalities.resource
Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser

Test Template   Valid Login Template

*** Test Cases ***
TC1     Admin   admin123    Dashboard
TC2     Admin   admin123    Dashboard

*** Keywords ***
Valid Login Template
    [Arguments]     ${username}     ${password}     ${expected_header}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//button[contains(normalize-space(),'Login')]
    Element Should Contain    xpath=//*[contains(normalize-space(),'Dashbo')]    ${expected_header}
