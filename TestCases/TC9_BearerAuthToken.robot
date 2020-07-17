*** Settings ***
Library  Collections
Library  RequestsLibrary
Library  OperatingSystem

*** Variables ***
${base_url}     https://certtransaction.elementexpress.com
${bearer_token}     "Bearer E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
CheckBearerTokenAPI
    create session  mysession   ${base_url}
    ${headers}=  create dictionary   Authorization=${bearer_token}   Content-Type=text/xml
    ${data_file}=   get file
    ${response}=    post request  mysession     /   data=${data_file}   headers=${headers}
