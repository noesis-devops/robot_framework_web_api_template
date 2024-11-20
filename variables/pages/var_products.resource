*** Settings ***
Documentation    This file stores the homepage variables


*** Variables ***
${PRODUCT_SECTION_BY_NAME_REPLACE}                        xpath=//form[@action="/Basket" and contains(.//span,'##VALUE##')]
${PRODUCT_ADD_TO_BASKET_BY_NAME_REPLACE}                  xpath=//form[@action="/Basket" and contains(.//span,'##VALUE##')]//input[@type="submit"]
${PRODUCT_NAME_TO_BUY}                                    '.NET Black & White Mug'

${PRODUCT_PAGE_CHECKOUT_BUTTON}                           xpath=//a[@href="/Basket/Checkout"]
${PRODUCT_PAGE_PAYNOW_BUTTON}                             xpath=//input[@value="[ Pay Now ]"]
${CHECKOUT_COMPLETE_MESSAGE}                              xpath=//div[contains(./h1,'Thanks for your Order!')]




