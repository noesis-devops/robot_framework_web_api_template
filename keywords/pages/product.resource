*** Settings ***
Documentation    This file contains the keywords for product actions

Library    SeleniumLibrary
Library    ../../.venv/Lib/site-packages/robot/libraries/String.py

Resource    ../../variables/pages/var_homepage.resource
Resource    ../../variables/pages/var_login.resource
Resource    ../../variables/pages/var_products.resource


*** Keywords ***
Add Product to Basket
    [Documentation]    Select a product from the list and click on "Add to Basket" button
    [Arguments]    ${PRODUCT_NAME}

    ${NEW_LOCATOR}=    Replace String    ${PRODUCT_SECTION_BY_NAME_REPLACE}    '##VALUE##'    ${PRODUCT_NAME}
    Wait Until Element Is Enabled    ${NEW_LOCATOR}
    ${NEW_LOCATOR_1}=    Replace String    ${PRODUCT_ADD_TO_BASKET_BY_NAME_REPLACE}    '##VALUE##'    ${PRODUCT_NAME}
    Click Element    ${NEW_LOCATOR_1}


Click Checkout Button
    [Documentation]    Click "Checkout" button on product page

    Wait Until Element Is Enabled    ${PRODUCT_PAGE_CHECKOUT_BUTTON}
    Click Element    ${PRODUCT_PAGE_CHECKOUT_BUTTON}

Click Pay Now Button
    [Documentation]    Click "Pay Now" button on product page

    Wait Until Element Is Enabled    ${PRODUCT_PAGE_PAYNOW_BUTTON}
    Click Element    ${PRODUCT_PAGE_PAYNOW_BUTTON}

Verify Checkout Complete
    [Documentation]    Check success message

    Wait Until Element Is Visible    ${CHECKOUT_COMPLETE_MESSAGE}