*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${base_url}     https://restcountries.eu

*** Test Cases ***
Get_CountryInfo
    create session  mysession   ${base_url}
    ${response}=    get request  mysession  /rest/v2/alpha/IN

    # Convert string to json
    ${json_obj}=    to json  ${response.content}

    #Single value validation
    ${country_name}=    get value from json     ${json_obj}     $.name
    log to console  ${country_name[0]}
    should be equal  ${country_name[0]}     India

    #Single data validation from array
    ${border}=    get value from json     ${json_obj}     $.borders[0]
    log to console  ${border[0]}
    should be equal  ${border[0]}     AFG

    #Multiple data validation in json array
    ${borders}=    get value from json     ${json_obj}     $.borders
    log to console  ${borders[0]}
    should contain any  ${borders[0]}   AFG     BGD     BTN     MMR     CHN     NPL     PAK     LKA
    should not contain any  ${borders[0]}   abc