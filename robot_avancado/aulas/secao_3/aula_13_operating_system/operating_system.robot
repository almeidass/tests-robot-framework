*** Settings ***
Documentation   http://robotframework.org/robotframework/latest/libraries/OperatingSystem.html
Library         OperatingSystem

*** Test Cases ***
Exemplo 01: Criando arquivos
    Criando um arquivo texto
    Criando um arquivo JSON

Exemplo 02: Copiando arquivos
    Copiando meu arquivo

Exemplo 03: Lendo meu arquivo
    Lendo o conteúdo
    Lendo o binário

Exemplo 04: Excluindo arquivos
    Listando arquivos do meu diretório
    Excluir arquivo     ${CURDIR}/arquivo_TEXTO_COPIA.txt
    Excluir arquivo     ${CURDIR}/arquivo_JSON_COPIA.json
    Listando arquivos do meu diretório

*** Keywords ***
Criando um arquivo texto
    Create File         ${CURDIR}/arquivo_TEXTO.txt     Esse curso vai me tornar um ninja em Robot Framework!!!!

Criando um arquivo JSON
    Create File         ${CURDIR}/arquivo_JSON.json     {"teste01": "valor01", "teste02": 2, "teste03": [1, 2, 3]}

Copiando meu arquivo
    Copy File           ${CURDIR}/arquivo_TEXTO.txt     ${CURDIR}/arquivo_TEXTO_COPIA.txt
    Copy File           ${CURDIR}/arquivo_JSON.json     ${CURDIR}/arquivo_JSON_COPIA.json

Lendo o conteúdo
    ## O conteúdo é retornado em STRING
    ${MEU_ARQUIVO}      Get File          ${CURDIR}/arquivo_TEXTO.txt
    ${SIZE}             Get File Size     ${CURDIR}/arquivo_TEXTO.txt
    Log   ${MEU_ARQUIVO}

Lendo o binário
    ## O binário é retornado
    Should Exist        ${CURDIR}/arquivo_PDF.pdf      msg=O arquivo não existe!! Verifique!
    ${MEU_ARQUIVO}      Get Binary File   ${CURDIR}/arquivo_PDF.pdf
    ${SIZE}             Get File Size     ${CURDIR}/arquivo_PDF.pdf
    Log   ${MEU_ARQUIVO}

Listando arquivos do meu diretório
    List Directory      ${CURDIR}

Excluir arquivo
    [Arguments]         ${ARQUIVO}
    Remove File         ${ARQUIVO}
