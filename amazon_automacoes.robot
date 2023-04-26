*** Settings ***
Documentation     Essa suíte testa o site da Amazon.com.br
Resource          amazon_automacoes_resources.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador   

*** Test Cases ***

Caso de Teste 01 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Clicar no produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso


Caso de Teste 02 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Clicar no produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Acessa carrinho de compras
    Remover o produto "Console Xbox Series S" do carrinho"
    Verificar se o carrinho fica vazio