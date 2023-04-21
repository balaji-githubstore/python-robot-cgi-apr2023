*** Settings ***
Library     RequestsLibrary


*** Keywords ***
Get Access Token
    [Arguments]     ${key}
    ${id}   Convert To Integer    ${key}
    Create Session    alias=petstore    url=https://petstore.swagger.io/v2
    ${response}     GET On Session    alias=petstore    url=/pet/${id}     expected_status=200
    [Return]    ${response.json()}[name]