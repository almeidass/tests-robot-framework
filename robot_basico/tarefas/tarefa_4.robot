*** Settings ***
Documentation   Tarefa Variaveis Tipo Dicionario
*** Variable ***
#Tipo Lista
&{MESES_DIAS_ANO}    janeiro=31   fevereiro=28   marco=31   abril=30   maio=31    junho=30    julho=31    agosto=31    setembro=30    outubro=31    novembro=30    dezembro=31

*** Test Cases ***
Imprimir a quantidade de dias de cada mes do ano
    Log To Console    ""
    Log To Console    Mes: janeiro Dias: ${MESES_DIAS_ANO.janeiro}
    Log To Console    Mes: fevereiro Dias: ${MESES_DIAS_ANO.fevereiro}
    Log To Console    Mes: março Dias: ${MESES_DIAS_ANO.marco}
    Log To Console    Mes: abril Dias: ${MESES_DIAS_ANO.abril}
    Log To Console    Mes: maio Dias: ${MESES_DIAS_ANO.maio}
    Log To Console    Mes: junho Dias: ${MESES_DIAS_ANO.junho}
    Log To Console    Mes: julho Dias: ${MESES_DIAS_ANO.julho}
    Log To Console    Mes: agosto Dias: ${MESES_DIAS_ANO.agosto}
    Log To Console    Mes: setembro Dias: ${MESES_DIAS_ANO.setembro}
    Log To Console    Mes: outubro Dias: ${MESES_DIAS_ANO.outubro}
    Log To Console    Mes: novembro Dias: ${MESES_DIAS_ANO.novembro}
    Log To Console    Mes: dezembro Dias: ${MESES_DIAS_ANO.dezembro}
