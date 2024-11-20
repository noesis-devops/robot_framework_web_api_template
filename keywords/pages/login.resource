*** Settings ***
Documentation    This file contains the keywords for login actions

Library    SeleniumLibrary

Resource    ../../variables/pages/var_homepage.resource
Resource    ../../variables/pages/var_login.resource


*** Keywords ***
Open The Login Page
    [Documentation]    Open The Login Page

    Wait Until Element Is Enabled    ${LOGIN_BUTTON}
    Click Element    ${LOGIN_BUTTON}

Input Username In The Login Page
    [Documentation]    Input Username In The Login Page
    [Arguments]     ${EMAIL_VALUE}

    Wait Until Element Is Enabled    ${EMAIL_INPUT}
    Input Text    ${EMAIL_INPUT}    ${EMAIL_VALUE}

Input Password In The Login Page
    [Documentation]    Input Password In The Login Page
    [Arguments]    ${PASSWORD_VALUE}

    Wait Until Element Is Enabled    ${PASSWORD_INPUT}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD_VALUE}

Click Submit In Login Page
    [Documentation]    Click Submit In Login Page

    Wait Until Element Is Enabled    ${SUBMIT_BUTTON}
    Click Button    ${SUBMIT_BUTTON}

Complete Login
    [Documentation]    Complete Login
    [Arguments]     ${EMAIL_VALUE}    ${PASSWORD_VALUE}
    
    Open The Login Page
    Input Username In The Login Page    ${EMAIL_VALUE}
    Input Password In The Login Page    ${PASSWORD_VALUE}
    Click Submit In Login Page

Complete Login With ${USERNAME} and ${PASSWORD}
    [Documentation]    Complete Login TEMPLATE
    
    Open The Login Page
    Input Username In The Login Page    ${USERNAME}
    Input Password In The Login Page    ${PASSWORD}
    Click Submit In Login Page

