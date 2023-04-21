*** Settings ***
Library     SeleniumLibrary

#varibales declared here can be controlled in command line
*** Variables ***
${BROWSER}      chrome
${URL}      https://opensource-demo.orangehrmlive.com/

*** Keywords ***
Launch Browser And Navigate To Url
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Set Screenshot Directory    path=${EXECDIR}${/}screenshots
    Go To    url=${URL}
