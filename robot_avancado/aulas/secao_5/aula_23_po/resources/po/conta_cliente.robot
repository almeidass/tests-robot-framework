*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR
Resource   home.robot

*** Variables ***
${TEXT_FIELD_EMAIL}              xpath://input[@id="email_create"]
${CREATE_ACCOUNT_BTN}            xpath://button[@id="SubmitCreate"]
${CONTAINER_ACCOUNT_CREATION}    xpath://div[@class="account_creation"]
${RADIO_GENDER_1}                xpath://input[@id="id_gender1"]
${TEXT_FIELD_FIRST_NAME}         xpath://input[@id="customer_firstname"]
${TEXT_FIELD_LAST_NAME}          xpath://input[@id="customer_lastname"]
${TEXT_FIELD_PASSWORD}           xpath://input[@id="passwd"]
${SELECTION_DAY}                 xpath://select[@id="days"]
${SELECTION_MONTH}               xpath://select[@id="months"]
${SELECTION_YEAR}                xpath://select[@id="years"]
${TEXT_FIELD_ADDRESS_1}          xpath://input[@id="address1"]
${TEXT_FIELD_FIRST_CITY}         xpath://input[@id="city"]
${TEXT_FIELD_FIRST_NAME}         xpath://input[@id="customer_firstname"]
${SELECTION_STATE}               xpath://select[@id="id_state"]
${TEXT_FIELD_POSTCODE}           xpath://input[@id="postcode"]
${SELECTION_COUNTRY}             xpath://select[@id="id_country"]
${TEXT_FIELD_PHONE_MOBILE}       xpath://input[@id="phone_mobile"]
${BTN_SUBMIT_ACCOUNT}            xpath://button[@id="submitAccount"]
${HEADING_MY_ACCOUNT}            xpath://h1[@class="page-heading" and contains(text(), "My account")]
${TITLE_MY_ACCOUNT}              My account - My Store  

*** Keywords ***
#### Gherkin
Quando eu realizo um cadastro válido
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    
Então o cadastro deve realizado com sucesso
    Conferir se o cadastro foi efetuado com sucesso

#### Ações
Informar um e-mail válido
    ${email_fake}                    FakerLibrary.Email
    Wait Until Element Is Visible    ${TEXT_FIELD_EMAIL}
    Input Text                       ${TEXT_FIELD_EMAIL}    ${email_fake}

Clicar em "Create an account"
    Wait Until Element Is Visible    ${CREATE_ACCOUNT_BTN}
    Click Element                    ${CREATE_ACCOUNT_BTN}

Preencher os dados obrigatórios
    ${first_name}        FakerLibrary.First Name
    ${last_name}         FakerLibrary.Last Name
    ${password}          Evaluate    random.randint(10000, 9999999)    random
    ${dia_mes}           Evaluate    random.randint(0, 28)    random
    ${mes}               Evaluate    random.randint(1, 12)    random
    ${ano}               Evaluate    random.randint(1900, 2006)    random
    ${endereco}          FakerLibrary.Street Address
    ${cidade}            FakerLibrary.City
    ${estado}            Evaluate    random.randint(1, 53)    random
    ${cep}               Evaluate    random.randint(10000, 99999)    random
    ${phone_mobile}      FakerLibrary.Phone Number

    Wait Until Element Is Visible    ${CONTAINER_ACCOUNT_CREATION}   timeout=20s
    Element Should Be Enabled        ${RADIO_GENDER_1}
    Click Element                    ${RADIO_GENDER_1}
    Input Text                       ${TEXT_FIELD_FIRST_NAME}        ${first_name}
    Input Text                       ${TEXT_FIELD_LAST_NAME}         ${last_name}
    Input Text                       ${TEXT_FIELD_PASSWORD}          ${password}
    Select From List By Value        ${SELECTION_DAY}                ${dia_mes}
    Select From List By Value        ${SELECTION_MONTH}              ${mes}
    Select From List By Value        ${SELECTION_YEAR}               ${ano}
    Input Text                       ${TEXT_FIELD_ADDRESS_1}         ${endereco}
    Input Text                       ${TEXT_FIELD_FIRST_CITY}        ${cidade}
    Select From List By Value        ${SELECTION_STATE}              ${estado}
    Input Text                       ${TEXT_FIELD_POSTCODE}          ${cep}
    Select From List By Index        ${SELECTION_COUNTRY}            1
    Input Text                       ${TEXT_FIELD_PHONE_MOBILE}      ${phone_mobile}

Submeter cadastro
    Click Element    ${BTN_SUBMIT_ACCOUNT}

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${HEADING_MY_ACCOUNT}
    Title Should Be                  ${TITLE_MY_ACCOUNT}
    Capture Page Screenshot
