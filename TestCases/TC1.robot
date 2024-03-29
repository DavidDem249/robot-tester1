*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}      https://demo.nopcommerce.com/

*** Test Cases ***
LoginTest
    # create webdriver    chrome    executable_path="C:\Driverss\chromedriver_win32\chromedriver.exe"
    open browser    ${url}   ${browser}
    loginToApplication
    Capture Page Screenshot
    close browser

*** Keywords ***
loginToApplication
    click link  xpath://a[@class='ico-login']
    input text    id:Email   david@gmail.com
    input text    id:Password   Test@123
    click element    xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[3]/button
