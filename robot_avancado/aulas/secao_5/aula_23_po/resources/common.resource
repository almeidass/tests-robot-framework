*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser                about:blank   ${BROWSER}
    Set Selenium Timeout	    20
    Maximize Browser Window
    
Fechar navegador
    Close Browser
