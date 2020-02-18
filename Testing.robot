*** Settings ***
Test Setup        Web headless
Library           Selenium2Library

*** Variables ***

*** Test Case ***
open browser
    go to    http://biscontroltest.lab-bizview.com/
    Input Text    id=txtUserName    fortest
    Input Text    id=txtPassword    123456
    Click Button    id=LoginButton
    sleep    1
    Click element    id=btnAddProject
    Click Element At Coordinates    id=myModal    500    500

open google
    go to    http://biscontroltest.lab-bizview.com/
    Input Text    id=txtUserName    fortest
    Input Text    id=txtPassword    123456
    Click Button    id=LoginButton
    Click element    //span[@id='lblMenu']/ul/li[9]/a
    Click Element    //span[@id='lblMenu']/ul/li[9]/ul/li[2]/a
    input text    id=txt-Under1-7    kittiwat
    click element    id=lblName7

*** Keywords ***
Web headless
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    #my_create_webdriver    Chrome    ${options}
    create webdriver    Chrome    chrome_options=${options}
    Maximize Browser Window
