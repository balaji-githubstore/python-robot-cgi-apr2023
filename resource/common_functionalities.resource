*** Settings ***
Library     SeleniumLibrary

#varibales declared here can be controlled in command line
*** Variables ***
${BROWSER}      chrome
${URL}      https://www.online.citibank.co.in/

*** Keywords ***
Launch Browser And Navigate To Url
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=${URL}

