*** Settings ***
Library         real_dollar_converter.py

*** Test Cases ***
Converter Real Para Dolar
    Converter "5" reais para dolar cotação "5"

*** Keywords ***
Converter "${REAIS}" reais para dolar cotação "${COTACAO_DOLAR}"
    ${valor}=    Converter Moeda    ${REAIS}    ${COTACAO_DOLAR}
    Log    ${valor}=
