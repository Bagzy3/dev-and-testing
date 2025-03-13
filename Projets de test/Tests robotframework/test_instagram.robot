*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}               https://manoncphoto.com/contact/
${BROWSER}           chrome
${INSTAGRAM_XPATH}   xpath=//img[contains(@src, "istockphoto-1278996256")]

*** Test Cases ***
Vérifier le Lien Instagram
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s

    # Accepter les cookies si la fenêtre s'affiche
    Run Keyword And Ignore Error    Click Element    xpath=//button[contains(text(), 'Accepter')]

    Click Element    ${INSTAGRAM_XPATH}
    Sleep    5s  # Laisser du temps pour l'ouverture du nouvel onglet

    # Passer au dernier onglet ouvert (plutôt que par le titre)
    Switch Window    NEW
    Sleep    2s

    # Vérifier si on est bien sur Instagram
    ${current_url} =    Get Location
    Should Contain    ${current_url}    instagramme.com

    Close Browser
