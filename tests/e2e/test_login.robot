*** Settings ***
Documentation    This file contains the test suite for <description>

Resource    ../../keywords/pages/login.resource
Resource    ../../keywords/common.resource

Test Setup    Run Keywords
...           Set And Open Browser

Test Teardown    Run Keywords
...    Close Environment


*** Test Cases ***
Test Login
    [Documentation]    Valid Login

    [Tags]    login    sanity
    
    Open The Login Page
    Input Username In The Login Page    ${LOGIN_USERNAME}
    Input Password In The Login Page    ${LOGIN_PASSWORD}
    Click Submit In Login Page

Test Login Test
    [Documentation]    Valid Login

    [Tags]    login    sanity
    
    Open The Login Page
    Input Username In The Login Page    ${LOGIN_USERNAME}
    Input Password In The Login Page    ${LOGIN_PASSWORD}
    Click Submit In Login Page
    


