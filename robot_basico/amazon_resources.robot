*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}                 chrome
${URL}                     https://www.amazon.com.br
${HOME_PAGE_TITULO}        Amazon.com.br | Tudo pra você, de A a Z.
${HOME_PAGE_MENU_NAV}      //div[@id="nav-xshop-container"]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site "${URL}"
    Go To    url=${URL}
    ${status}    ${value}=        Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath:${HOME_PAGE_MENU_NAV}    timeout=10s
    Run Keyword If    '${status}' == 'FAIL'	           Reload Page
    Title Should Be                    ${HOME_PAGE_TITULO}

Entrar no menu "${MENU}"
    Click Element    xpath://div[@id="nav-xshop"]//a[contains(text(), "${MENU}")]

Verificar se o título da página fica "${TITULO_PAGINA}"
    Wait Until Element Is Visible      xpath:${HOME_PAGE_MENU_NAV}    timeout=10s
    Title Should Be    title=${TITULO_PAGINA}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains         text=${FRASE}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    xpath://a[contains(text(), "${NOME_CATEGORIA}")]

Digitar o nome de produto "${TERMO_PESQUISA}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${TERMO_PESQUISA}
Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    //span[contains(text(), "${PRODUTO}")]

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
    Wait Until Element Is Visible    xpath://a[text()="${PRODUTO}"]
    Click Element                    xpath://a[text()="${PRODUTO}"]
    Wait Until Element Is Visible    xpath://div[@class="a-button-stack"]//input[@id="add-to-cart-button"]
    Wait Until Element Is Visible    xpath://div[@class="a-button-stack"]//input[@id="buy-now-button"]
    Click Element                    xpath://*[@id="add-to-cart-button"]
    Wait Until Element Is Visible    xpath://span[contains(text(), "Adicionado ao carrinho")]
    Wait Until Element Is Visible    xpath://div[@id="sw-atc-confirmation"]

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
    Click Element                      id=nav-cart
    Wait Until Element Is Visible      xpath:${HOME_PAGE_MENU_NAV}    timeout=10s
    Element Should Be Visible          xpath://div[@data-name="Active Cart"]
    Element Should Be Visible          xpath://div[@data-name="Active Cart"]//h1[contains(text(), "Carrinho de compras")]
    Element Text Should Be             xpath://div[@data-name="Active Cart"]//span[@class="a-truncate-cut"]       ${PRODUTO}

E existe o produto "${PRODUTO}" no carrinho
    Quando adicionar o produto "${PRODUTO}" no carrinho

Quando remover o produto "${PRODUTO}" do carrinho
    Remover o produto "${PRODUTO}" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio 
    