*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}             chrome
${URL}                 https://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site "${URL}"
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "${MENU}"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se o título da página fica "${TITULO_ELETRONICOS_TECNOLOGIA}"
    Title Should Be    title=${TITULO_ELETRONICOS_TECNOLOGIA}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=//h1[contains(.,'${FRASE}')]

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//span[@class='nav-a-content'][contains(.,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${TERMO_PESQUISA}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${TERMO_PESQUISA}
Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]

Dado que estou na home page "${URL}"
    Acessar a home page do site "${URL}"

Quando acessar o menu "${MENU}"
    Entrar no menu "${MENU}"

Então o título da página deve ficar "${TITULO_PAGINA}"
    Verificar se o título da página fica "${TITULO_PAGINA}"

E o texto "${FRASE}" deve ser exibido na página
    Verificar se aparece a frase "${FRASE}"

E a categoria "${NOME_CATEGORIA}" deve ser exibida na página
    Verificar se aparece a categoria "${NOME_CATEGORIA}"

Quando pesquisar pelo produto "${TERMO_PESQUISA}"
    Input Text    locator=twotabsearchtextbox    text=${TERMO_PESQUISA}
    Clicar no botão de pesquisa

E um produto da linha "${PRODUTO}" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    Wait Until Element Is Visible    locator=//div[@class='a-button-stack'][contains(.,'Adicionar ao carrinho')]
    sleep  5s
    Click Element    locator=add-to-cart-button
    Wait Until Element Is Visible    locator=//input[contains(@aria-labelledby,'attachSiNoCoverage-announce')]
    Click Element    locator=//input[contains(@aria-labelledby,'attachSiNoCoverage-announce')]

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]

Remover o produto "${PRODUTO}" do carrinho
    Click Element    id=nav-cart
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]
    Click Element    locator=//input[@value='Excluir']

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

Quando adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Adicionar o produto "${PRODUTO}" no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

Então o produto "${PRODUTO}" deve ser mostrado no carrinho
    Click Element    id=nav-cart
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

E existe o produto "${PRODUTO}" no carrinho
    Quando adicionar o produto "${PRODUTO}" no carrinho

Quando remover o produto "${PRODUTO}" do carrinho
    Remover o produto "${PRODUTO}" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio 
    
