*** Settings ***
Library    SeleniumLibrary    timeout=120    implicit_wait=5

Test Teardown    Sleep_and_close_browser

*** Variables ***
${URL}    https://www.google.it/
${BROWSER}    firefox
${ARUBA}    ARUBA
${XPATH_ARUBA}    xpath=//*[@id="rso"]/div[1]/div/div/div/div/div[1]/a
${ARUBA_PEC}    ARUBA PEC

*** Keywords ***
Sleep_and_close_browser
    Sleep    5s
    Close Browser

Ricerca_su_Google
    [Arguments]    ${url}    ${browser}    ${search_string}    ${xpath}
    Open Browser    ${url}    ${browser}
    Input Text   xpath=//*[@class="gLFyf gsfi"]   ${search_string}
    Press Keys    None    \ue007
    Sleep    5s
    Click Element    ${xpath}

*** Test Cases ***
Ricerca_siti_web
    [Template]    Ricerca_su_Google
    ${URL}    ${BROWSER}    ${ARUBA}    ${XPATH_ARUBA}
    ${URL}    ${BROWSER}    ${ARUBA_PEC}    ${XPATH_ARUBA}
    
        