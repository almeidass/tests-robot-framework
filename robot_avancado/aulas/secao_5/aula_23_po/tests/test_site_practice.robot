*** Settings ***
Resource            ../resources/common.resource
Resource            ../resources/po/home.robot
Resource            ../resources/po/carrinho.robot
Resource            ../resources/po/conta_cliente.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Caso de Teste com PO 01: Remover Produtos do Carrinho
    Home.Acessar a página home do site
    Home.Adicionar o produto "t-shirt" no carrinho
    Carrinho.Excluir o produto do carrinho
    Carrinho.Conferir se o carrinho fica vazio

### EXERCÍCIO
Caso de Teste com PO 02: Adicionar Cliente
    Dado que eu acesse home do site
    Quando eu realizo um cadastro válido
    Então o cadastro deve realizado com sucesso
