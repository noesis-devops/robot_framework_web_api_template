*** Settings ***
Documentation    This file contains the test suite for <description>

Library    RequestsLibrary
Library    Collections
Library    FakerLibrary

Resource    ../../keywords/api/users.resource
Resource    ../../keywords/api/products.resource


*** Variables ***


*** Test Cases ***
API: Register a product
    API serverest Login
    Register a new user
    Get Token
    Register a Product    ${TOKEN}
    Get Products List    ${TOKEN}
