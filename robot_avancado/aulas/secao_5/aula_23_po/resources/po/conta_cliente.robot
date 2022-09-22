*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR

*** Variables ***
${TEXT_FIELD_EMAIL}        xpath://input[@id="email_create"]
${CREATE_ACCOUNT_BTN}      xpath://button[@id="SubmitCreate"]

*** Keywords ***
#### Ações
Informar um e-mail válido
    ${email_fake}                    FakerLibrary.Email
    Wait Until Element Is Visible    ${TEXT_FIELD_EMAIL}
    Input Text                       ${TEXT_FIELD_EMAIL}    ${email_fake}

Clicar em "Create an account"
    Wait Until Element Is Visible    ${CREATE_ACCOUNT_BTN}
    Click Element                    ${CREATE_ACCOUNT_BTN}

Preencher os dados obrigatórios
    ${first_name}    FakerLibrary.First Name
    ${last_name}     FakerLibrary.Last Name
    ${password}      FakerLibrary.Password
    ${dia_mes}       Evaluate    random.randint(0, 28)    random
    ${mes}           Evaluate    random.randint(1, 12)    random
    ${ano}           Evaluate    random.randint(1900, 2006)    random
    ${endereco}      FakerLibrary.Street Address
    ${cidade}        FakerLibrary.City
    ${estado}        Evaluate    random.randint(1, 53)    random

    Click Element    xpath://input[@id="id_gender1"]
    Input Text    xpath://input[@id="customer_firstname"]    ${first_name}
    Input Text    xpath://input[@id="customer_lastname"]     ${last_name}
    Input Text    xpath://input[@id="passwd"]     ${password}
    Select From List By Value    xpath://select[@id="days"]    ${dia_mes}
    Select From List By Value    xpath://select[@id="months"]    ${mes}
    Select From List By Value    xpath://select[@id="years"]    ${ano}
    Input Text    xpath://input[@id="address1"]    ${endereco}
    Input Text    xpath://input[@id="city"]    ${cidade}
    Select From List By Value    xpath://select[@id="id_state"]    ${estado}
    sleep    1

