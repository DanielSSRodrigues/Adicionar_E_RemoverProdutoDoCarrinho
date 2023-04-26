*** Settings ***
Library   SeleniumLibrary 

*** Variables ***

${URL}         http://www.amazon.com.br/
${MENU_ELETRONICOS}       //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELOTRONICOS}     //h1[contains(.,'Eletrônicos e Tecnologia')]   
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia        
${PESQUISA}                    field-keywords

*** Keywords ***

Abrir o navegador                        
    Open Browser           browser=chrome
    Maximize Browser Window    

Fechar o navegador
    Capture Page Screenshot
    Close Browser   

Acessar a home page do site Amazon.com.br
        Go To             url=${URL}  
    Wait Until Element Is Visible        locator=${MENU_ELETRONICOS}      timeout=20s   #assertiva para garantir que a pagína está visivel

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
        Input Text        locator=${PESQUISA}   text=${PRODUTO}

Clicar no botão pesquisa
        Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
        Wait Until Element Is Visible        locator=(//span[contains(.,'${PRODUTO}')])[2]    timeout=30s

Clicar no produto "${PRODUTO}"
        Click Element    locator=//img[contains(@alt,'${PRODUTO}')]

Adicionar o produto "Console Xbox Series S" no carrinho
     Click Element    locator=//input[contains(@name,'submit.add-to-cart')]

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Page Contains       text=Adicionado ao carrinho

Acessa carrinho de compras
    Click Element        locator=//a[contains(@data-csa-c-type,'button')]
    
Remover o produto "Console Xbox Series S" do carrinho"
    Click Button        locator=Excluir

Verificar se o carrinho fica vazio
    Wait Until Page Contains        text=foi removido de Carrinho de compras.
