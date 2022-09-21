*** Settings ***
Documentation       Documentação da API: https://fakerestapi.azurewebsites.net/index.html
 
Library             Collections
Library             RequestsLibrary
 
*** Variables ***
${URL_API}      https://fakerestapi.azurewebsites.net/api/v1
&{BOOK_15}      id=15
...             title=Book 15
 
*** Keywords ***
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}
 
Requisitar todos os livros
    ${RESPOSTA}    Get Request    fakeAPI    Books
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
 
Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    Get Request    fakeAPI    Books/${ID_LIVRO}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
 
Cadastrar um novo livro
    ${HEADERS}    Create Dictionary    content-type=application/json
    ${REQUEST_DATA}    Create Dictionary    id=13131313    title=Batata    description=Batata Palha    pageCount=100
    ...    excerpt=Xuxu    publishDate=2022-03-30T13:44:36.393Z
    Set Test Variable    ${REQUEST_DATA}
    ${RESPOSTA}    Post Request    fakeAPI    Books
    ...    data=${REQUEST_DATA}
    ...    headers=${HEADERS}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Conferir o status code    200
    Conferir o reason    OK
    Conferir se retorna todos os dados cadastrados para um novo livro
 
Atualizar todos os dados de um livro
    ${HEADERS}    Create Dictionary    content-type=application/json
    ${REQUEST_DATA}    Create Dictionary    id=151515    title=Na minha maquina funciona
    ...    description=NA MINHA MAQUINA FUNCIONA    pageCount=200    excerpt=TI
    ...    publishDate=2022-03-25T13:44:36.393Z
    Set Test Variable    ${REQUEST_DATA}
    ${RESPOSTA}    Put Request    fakeAPI    Books/${RESPOSTA.json()['id']}
    ...    data=${REQUEST_DATA}
    ...    headers=${HEADERS}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Conferir o status code    200
    Conferir o reason    OK
    Conferir se retorna todos os dados cadastrados para um novo livro
 
Deletar um livro
    ${HEADERS}    Create Dictionary    content-type=application/json
    ${RESPOSTA}    Delete Request    fakeAPI    Books/${RESPOSTA.json()['id']}    headers=${HEADERS}
    Log    ${RESPOSTA.text}
    Conferir o status code    200
    Conferir o reason    OK
 
Conferir o status code
    [Arguments]    ${STATUS_CODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUS_CODE_DESEJADO}
 
Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}
 
Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}    ${QTDE_LIVROS}
 
Conferir se retorna todos os dados corretos do livro 15
    Dictionary Should Contain Key    ${RESPOSTA.json()}    id    ${BOOK_15.id}
    Dictionary Should Contain Key    ${RESPOSTA.json()}    title    ${BOOK_15.title}
 
Conferir se retorna todos os dados cadastrados para um novo livro
    Dictionary Should Contain Key    ${RESPOSTA.json()}    id    ${REQUEST_DATA.id}
    Dictionary Should Contain Key    ${RESPOSTA.json()}    title    ${REQUEST_DATA.title}
    Dictionary Should Contain Key    ${RESPOSTA.json()}    description    ${REQUEST_DATA.description}
    Dictionary Should Contain Key    ${RESPOSTA.json()}    pageCount    ${REQUEST_DATA.pageCount}
    Dictionary Should Contain Key    ${RESPOSTA.json()}    excerpt    ${REQUEST_DATA.excerpt}
    Dictionary Should Contain Key    ${RESPOSTA.json()}    publishDate    ${REQUEST_DATA.publishDate}
    