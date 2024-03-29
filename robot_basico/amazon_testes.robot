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
    Acessar a home page do site "https://www.amazon.com.br"
    Entrar no menu "Mais Vendidos"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    Verificar se aparece a frase "Mais Vendidos"
    Verificar se aparece a categoria "Computadores e Informática"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]     Este teste verifica a busca de um produto
    [Tags]              busca_produtos  lista_busca
    Acessar a home page do site "https://www.amazon.com.br"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site "${URL}"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Xbox Series S" no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site "${URL}"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Xbox Series S" no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso
    Remover o produto "Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio
    