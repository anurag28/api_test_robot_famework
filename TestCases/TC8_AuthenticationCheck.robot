*** Settings ***
Library  Collections
Library  RequestsLibrary

*** Variables ***
${base_url}     http://restapi.demoqa.com

*** Test Cases ***
TC1
    ${auth}=    create list  ToolsQA    TestPassword
    create session  mysession   ${base_url}     auth=${auth}
    ${response}=    get request  mysession  /Authentication/CheckForAuthentication/
    log to console  ${response.content}
    should be equal as strings  ${response.status_code}     200