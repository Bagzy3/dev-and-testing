*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       https://manoncphoto.com/contact/
${BROWSER}   chrome

*** Test Cases ***
Remplir et Envoyer le Formulaire de Contact
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s

    Input Text    name=kb_field_0    Jean Dupont
    Input Text    name=kb_field_1    jean.dupont@example.com
    Input Text    name=kb_field_2    Ceci est un message de test envoyé via Robot Framework. gibs

    Click Button    xpath=//button[contains(text(), "Envoyer")]

    Sleep    5s
    Close Browser
