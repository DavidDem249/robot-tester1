*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}      chrome
${urlblank}     about:blank
${url}      https://e-logor.com/

*** Test Cases ***
LoginTest
    #open browser        ${url}      ${browser}
    open browser        ${urlblank}      ${browser}
    Go To       ${url}
    Maximize Browser Window
    #loginToApp
    popupClose
    #
    choisirProduit
    #
    ajouterAuPanier
    #
    commanderProduit
    close browser


*** Keywords ***

loginApp
    input text      id:email    customer@example.com
    input text      xpath://*[@id="login_modal"]/div/div/div[2]/div/form/div[2]/input     123456
    #wait until element is visible       xpath://*[@id="login_modal"]/div/div/div[2]/div/form/div[4]/button      timeout=10s

choisirProduit
    # Cliquer sur les catégories de produit
    Capture Page Screenshot
    click link       xpath:/html/body/div[1]/header/div[2]/div[1]/div/div[2]/div/ul/li[5]/a
    # Choisir une categorie
    Capture Page Screenshot
    click link      xpath:/html/body/div[1]/section[2]/div/div[2]/div[1]/a
    # choisir un produit
    Capture Page Screenshot
    #click link      xpath://*[@id="search-form"]/div/div[2]/div[2]/div/div[1]/div/div[1]/a[1]
    click link      xpath://*[@id="search-form"]/div/div[2]/div[2]/div/div[2]/div/div[1]/a[1]

ajouterAuPanier
    # Cliquer sur le bouton ajouter au panier
    Capture Page Screenshot
    click element       xpath:/html/body/div[1]/section[1]/div/div/div/div[2]/div/div[6]/button[2]
    # Remplir le formulaire modal pour se connecter
    Capture Page Screenshot
    input text      id:email    customer@example.com
    input text      xpath://*[@id="login_modal"]/div/div/div[2]/div/form/div[2]/input     123456
    wait until element is visible       xpath://*[@id="login_modal"]/div/div/div[2]/div/form/div[4]/button      timeout=10s
    Capture Page Screenshot
    click element       xpath://*[@id="login_modal"]/div/div/div[2]/div/form/div[4]/button
    #wait until element is visible       xpath:/html/body/div[1]/section[1]/div/div/div/div[2]/div/div[6]/button[1]      timeout=10s
    # Ajouter maintenant
    click element       xpath:/html/body/div[1]/section[1]/div/div/div/div[2]/div/div[6]/button[2]


visualiserLePanier
    Capture Page Screenshot
    click element     xpath:/html/body/div[1]/header/div[2]/div[1]/div/div[2]/div/ul/li[5]/a


commanderProduit
    Capture Page Screenshot
    # Cliquer sur le boutton 'Continuer vers l'expedition
    Wait Until Element Is Visible   xpath://*[@id="cart-summary"]/div/div/div/div/div[3]/div[2]/a      10
    click element     xpath://*[@id="cart-summary"]/div/div/div/div/div[3]/div[2]/a

    # Bouton 'Continuer vers les informations de livrason'
    Capture Page Screenshot
    Wait Until Element Is Visible   xpath:/html/body/div[1]/section[2]/div/div/div/form/div/div[3]/div[2]/button
    Click Element       xpath:/html/body/div[1]/section[2]/div/div/div/form/div/div[3]/div[2]/button

    # Le bouton 'Continuer au paiement'
    Capture Page Screenshot
    Wait Until Element Is Visible   xpath:/html/body/div[1]/section[2]/div/div/div/div/form/div[2]/button
    Click Element       xpath:/html/body/div[1]/section[2]/div/div/div/div/form/div[2]/button

    # Sélectionner le moyen de paiement
    Capture Page Screenshot
    Wait Until Element Is Visible   xpath:/html/body/div[1]/section[2]/div/div/div[1]/form/div/div[4]/div/div[2]/label/span/img
    # Paiement par CinetPay
    # Click Element       xpath://*[@id="checkout-form"]/div/div[4]/div/div[1]/label/span
    Click Element       xpath:/html/body/div[1]/section[2]/div/div/div[1]/form/div/div[4]/div/div[2]/label/span/img

    # Cocher la case checkbox
    Capture Page Screenshot
    Wait Until Element Is Visible   xpath://*[@id="checkout-form"]/div/div[5]/label/span[1]
    Click Element       xpath://*[@id="checkout-form"]/div/div[5]/label/span[1]
    # Bouton 'Compléter la commande'
    Click Element       xpath://*[@id="checkout-form"]/div/div[6]/div[2]/button

    # La page de félicitation
    Capture Page Screenshot
    Wait Until Element Is Visible   xpath:/html/body/div[1]/section[2]/div/div/div/div[1]/h1    timeout=10s

popupClose
    input text      xpath:/html/body/div[3]/div[2]/div/div[2]/form/div/input        test@gmail.com
    click element       xpath:/html/body/div[3]/div[2]/div/button
    click element       xpath:/html/body/div[2]/div/button


