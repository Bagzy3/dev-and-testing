*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}               https://manoncphoto.com/contact/
${BROWSER}           chrome
${FACEBOOK_XPATH}   xpath=//img[contains(@src, "bf0761570055d7ce0c044e43e6f406be")]

*** Test Cases ***
Vérifier le Lien Facebook
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s

    # Accepter les cookies si la fenêtre s'affiche
    Run Keyword And Ignore Error    Click Element    xpath=//button[contains(text(), 'Accepter')]

    Click Element    ${FACEBOOK_XPATH}
    Sleep    5s  # Laisser du temps pour l'ouverture du nouvel onglet

    # Passer au dernier onglet ouvert (plutôt que par le titre)
    Switch Window    NEW
    Sleep    2s

    # Vérifier si on est bien sur Instagram
    ${current_url} =    Get Location
    Should Contain    ${current_url}    facebook.com

    Close Browser