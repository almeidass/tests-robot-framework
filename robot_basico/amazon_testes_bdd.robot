*** Settings ***
Documentation   Essa suíte testa o site da Amazon.com.br
Resource        amazon_resources.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Case ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]     Este teste verifica o menu eletrônicos do site amazon.com.br
    ...                 e verifica a categoria Computadores e Informática
    [Tags]              menus   categorias
    Dado que estou na home page "https://www.amazon.com.br"
    Quando acessar o menu "Mais Vendidos"
    Então o título da página deve ficar "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    E o texto "Mais Vendidos" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]     Este teste verifica a busca de um produto
    [Tags]              busca_produtos  lista_busca
    Dado que estou na home page "https://www.amazon.com.br"
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page "${URL}"
    Quando adicionar o produto "Xbox Series S" no carrinho
    Então o produto "Xbox Series S" deve ser mostrado no carrinho
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho    wip
    Dado que estou na home page "${URL}"
    E existe o produto "Xbox Series S" no carrinho
    Quando remover o produto "Xbox Series S" do carrinho
    Então o carrinho deve ficar vazio
