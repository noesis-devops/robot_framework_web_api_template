*** Settings ***
Documentation    This file contains the keywords for api tests, user section

Library    RequestsLibrary
Library    Collections
Library    FakerLibrary

Resource    ../../variables/var_global.resource

*** Keywords ***
Set Random User Data
    [Documentation]

    ${RANDOM_NOME_FIRST}   FakerLibrary.First Name
    ${RANDOM_NOME_LAST}    FakerLibrary.Last Name
    ${RANDOM_EMAIL}   FakerLibrary.Email
    ${RANDOM_PWD}     FakerLibrary.Password
    ${USUARIO}    Create Dictionary    nome=${RANDOM_NOME_FIRST} ${RANDOM_NOME_LAST}  email=${RANDOM_EMAIL}  senha=${RANDOM_PWD}
    Set Suite Variable    ${USUARIO}

API serverest Login
    [Documentation]

    ${HEADERS}   Create Dictionary  Content-Type=application/json
    # Create Session    alias=${ALIAS}    url=https://serverest.dev   headers=${HEADERS}   disable_warnings=1
    Create Session    alias=${ALIAS}    url=http://localhost:4444   headers=${HEADERS}   disable_warnings=1

Register a new user
    [Documentation]

    Set Random User Data
    ${BODY}      Create Dictionary   nome=${USUARIO.nome}   email=${USUARIO.email}   password=${USUARIO.senha}   administrador=true
    ${RESPONSE}  POST On Session     alias=${ALIAS}    url=usuarios    json=${BODY}
    Log   Response: ${\n}${RESPONSE.text}

Get Token
    [Documentation]
    
    ${BODY}      Create Dictionary   email=${USUARIO.email}   password=${USUARIO.senha}
    ${RESPONSE}  POST On Session     alias=${ALIAS}    url=login    json=${BODY}
    Log   Response: ${\n}${RESPONSE.text}
    Dictionary Should Contain Item    ${RESPONSE.json()}    message    Login realizado com sucesso
    ${TOKEN}     Get From Dictionary    ${RESPONSE.json()}    authorization
    Set Suite Variable    ${TOKEN}