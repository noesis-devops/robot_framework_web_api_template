*** Settings ***
Documentation    This file contains the test suite for <description>

Resource    ../../keywords/pages/login.resource
Resource    ../../keywords/pages/product.resource
Resource    ../../keywords/common.resource
Resource    ../../variables/pages/var_products.resource

Test Setup    Run Keywords
...           Set And Open Browser    AND
...           Complete Login    ${LOGIN_USERNAME}    ${LOGIN_PASSWORD}

Test Teardown    Run Keywords
...    Close Environment


*** Test Cases ***
Buy a product
    [Documentation]    Buy a product
    [Tags]    Product
    
    Add Product to Basket    ${PRODUCT_NAME_TO_BUY}
    Click Checkout Button
    Click Pay Now Button
    Verify Checkout Complete

    


