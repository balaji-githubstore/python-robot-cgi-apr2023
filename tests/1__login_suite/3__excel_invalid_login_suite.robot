*** Settings ***
Documentation   This suite handles invalid login of orange HRM
...     connected to story rdp-003

Resource    ../../resource/base/CommonFunctionalities.resource
Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser

Library     DataDriver      file=../../test_data/orange_data.xlsx   sheet_name=InvalidLoginTemplate

Test Template   Invalid Login Template

*** Test Cases ***
Invalid Login Test ${tc_name}

*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//button[contains(normalize-space(),'Login')]
    Element Should Contain    xpath=//*[contains(normalize-space(),'Invalid')]    ${expected_error}
