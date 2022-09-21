*** Settings ***
Documentation   5 ou 10

*** Variables ***
@{MEUS_NUMEROS}   1  2  3  4  5  6  7  8  9  10  11  12 13

*** Test Case ***
Imprima 5 ou 10
    Imprimir valores

*** Keywords ***
Imprimir valores
    Log To Console    \n
    FOR  ${NUMERO}   IN  @{MEUS_NUMEROS}
        Log To Console    Numero: ${NUMERO}
        IF    '${NUMERO}' == '5' or '${NUMERO}' == '10'
            Log To Console    Eu sou o número ${NUMERO}!
        ELSE
            Log To Console    Eu não sou o número 5 e nem o 10!
        END
    END
