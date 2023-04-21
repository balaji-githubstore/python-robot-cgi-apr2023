*** Settings ***
Documentation   This suite handles invalid login of orange HRM
...     connected to story rdp-003

Resource    ../../resource/base/CommonFunctionalities.resource
Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser

Test Template   Invalid Login Template

*** Test Cases ***
TC1     john   admin123    Invalid credentials
TC2     peter   admin123    Invalid credentials

*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//button[contains(normalize-space(),'Login')]
    Element Should Contain    xpath=//*[contains(normalize-space(),'Invalid')]    ${expected_error}
