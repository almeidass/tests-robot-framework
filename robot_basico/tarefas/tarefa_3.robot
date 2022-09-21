*** Settings ***
Documentation   Tarefa Variaveis Tipo Lista
*** Variable ***
#Tipo Lista
@{MESES_ANO}    janeiro   fevereiro   março   abril   maio    junho    julho    agosto    setembro    outubro    novembro    dezembro

*** Test Cases ***
Imprimir meses do ano
    Log To Console    Mes: ${MESES_ANO[0]}
    Log To Console    Mes: ${MESES_ANO[1]}
    Log To Console    Mes: ${MESES_ANO[2]}
    Log To Console    Mes: ${MESES_ANO[3]}
    Log To Console    Mes: ${MESES_ANO[4]}
    Log To Console    Mes: ${MESES_ANO[5]}
    Log To Console    Mes: ${MESES_ANO[6]}
    Log To Console    Mes: ${MESES_ANO[7]}
    Log To Console    Mes: ${MESES_ANO[8]}
    Log To Console    Mes: ${MESES_ANO[9]}
    Log To Console    Mes: ${MESES_ANO[10]}
    Log To Console    Mes: ${MESES_ANO[11]}