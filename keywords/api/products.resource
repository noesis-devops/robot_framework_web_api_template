*** Settings ***
Documentation    This file contains the keywords for api tests, user section

Library    RequestsLibrary
Library    Collections
Library    FakerLibrary

Resource    ../../variables/var_global.resource

*** Keywords ***
Register a Product
    [Documentation]
    [Arguments]    ${TOKEN}

    ${RANDOM_PROD}   FakerLibrary.Word
    Set Suite Variable    ${RANDOM_PROD}
    ${BODY}      Create Dictionary  nome=${RANDOM_PROD}   preco=155   descricao=my product   quantidade=10
    ${HEADERS}   Create Dictionary  Authorization=${TOKEN}
    ${RESPONSE}  POST On Session    alias=${ALIAS}    url=produtos    json=${BODY}  headers=${HEADERS}
    Log   Response: ${\n}${RESPONSE.text}
    Dictionary Should Contain Item    ${RESPONSE.json()}    message    Cadastro realizado com sucesso
    ${PRODUCT_ID}  Get From Dictionary    ${RESPONSE.json()}    _id
    Set Suite Variable   ${PRODUCT_ID}

Get Products List
    [Documentation]
    [Arguments]    ${TOKEN}

    ${HEADERS}   Create Dictionary  Authorization=${TOKEN}
    ${RESPONSE}  GET On Session     alias=${ALIAS}    url=produtos/${PRODUCT_ID}  headers=${HEADERS}
    Log   Response: ${\n}${RESPONSE.text}
    Dictionary Should Contain Item    ${RESPONSE.json()}    nome        ${RANDOM_PROD}
    Dictionary Should Contain Item    ${RESPONSE.json()}    preco       ${155}
    Dictionary Should Contain Item    ${RESPONSE.json()}    descricao   my product
    Dictionary Should Contain Item    ${RESPONSE.json()}    quantidade  ${10}
    Dictionary Should Contain Key     ${RESPONSE.json()}    _id