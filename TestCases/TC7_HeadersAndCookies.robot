*** Settings ***
Library  Collections
Library  RequestsLibrary

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com

*** Test Cases ***
CheckHeader
    create session  mysession   ${base_url}
    ${response}=    get request  mysession      /photos

    #log to console  ${response.headers}
    ${content_type}=    get from dictionary  ${response.headers}    Content-Type
    #log to console  ${content_type}
    should be equal  ${content_type}    application/json; charset=utf-8

CheckCookies
    create session  mysession   ${base_url}
    ${response}=    get request  mysession      /photos
    #log to console  ${response.cookies}
    ${cookie_value}=    get from dictionary  ${response.cookies}    __cfduid
    log to console  ${cookie_value}