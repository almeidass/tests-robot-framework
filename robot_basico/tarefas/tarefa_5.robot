*** Settings ***
Documentation   Tarefa Email Customizado
Library    FakerLibrary    locale=pt_BR
*** Variable ***
#Tipo Lista
&{PESSOA}    nome=Manuela    sobre_nome=Almeida    

*** Test Cases ***
Email customizado
   ${EMAIL_CUSTOMIZADO}    Gerar email customizado    ${PESSOA.nome}   ${PESSOA.sobre_nome} 
    Log To Console    ${EMAIL_CUSTOMIZADO}

*** Keywords ***
Gerar email customizado
    [Arguments]     ${NOME}   ${SOBRE_NOME}
    ${LAST_NAME}=    FakerLibrary.Last Name
    ${EMAIL_CUSTOMIZADO}    Set Variable    ${NOME}_${SOBRE_NOME}_${LAST_NAME}@testerobot.com
    [Return]    ${EMAIL_CUSTOMIZADO}
    