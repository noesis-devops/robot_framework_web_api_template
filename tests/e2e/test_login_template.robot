*** Settings ***
Documentation    This file contains the test suite for <description>

Resource    ../../keywords/pages/login.resource
Resource    ../../keywords/common.resource

Test Setup    Run Keywords
...           Set And Open Browser

Test Teardown    Run Keywords
...    Close Environment

Test Template    Complete Login

*** Test Cases ***
Test1    ${LOGIN_USERNAME}        ${LOGIN_PASSWORD}
Test2    'test'                   ${LOGIN_PASSWORD}
Test3    ${LOGIN_USERNAME}        test
