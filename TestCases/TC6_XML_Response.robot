*** Settings ***
Library  Collections
Library  XML
Library  RequestsLibrary
Library  os

*** Variables ***
${base_url}     http://thomas-bayer.com

*** Test Cases ***
TC1
    create session  mysession   ${base_url}
    ${response}=    get request  mysession  /sqlrest/CUSTOMER/15

    #convert to string
    ${xml_string}=     convert to string  ${response.content}
    ${xml_obj}=     parse xml   ${xml_string}


    #Check single element value
    element text should be  ${xml_obj}  15  .//ID

    #Check mulitple values
    ${child_elements}=      get child elements  ${xml_obj}
    should not be empty  ${child_elements}
    ${id}=  get element text  ${child_elements[0]}
    ${fname}=  get element text  ${child_elements[1]}
    ${lname}=  get element text  ${child_elements[2]}
    ${street}=  get element text  ${child_elements[3]}
    ${city}=  get element text  ${child_elements[4]}
    should be equal  ${id}  15
    should be equal  ${fname}   Bill
    should be equal  ${lname}   Clancy
    should be equal  ${street}  319 Upland Pl.
    should be equal  ${city}    Seattle
