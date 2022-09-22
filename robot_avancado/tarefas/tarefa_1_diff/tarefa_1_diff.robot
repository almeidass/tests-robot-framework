*** Settings ***
Documentation   https://github.com/MarketSquare/robotframework-difflibrary
Library         DiffLibrary

*** Test Cases ***
Comparar dois arquivos
    Comparar Arquivos    ${CURDIR}/file1.txt    ${CURDIR}/file2.txt

*** Keywords ***
Comparar Arquivos
    [Arguments]    ${arquivo_1}    ${arquivo_2}
    Diff Files     ${arquivo_1}    ${arquivo_2}    fail=False
