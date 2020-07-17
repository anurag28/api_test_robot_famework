*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}     http://restapi.demoqa.com/customer


*** Test Cases ***
Put_Customer_Registration
    create session  mysession   ${base_url}
    ${body}=    create dictionary  FirstName=Johnty  LastName=Doze    UserName=dozeJohnty   Password=jdoe245    Email=jdoe56@hotmail.com
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=     post request  mysession    /register   data=${body}   headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}

    #Validations
    ${res_body}=    convert to string  ${response.content}
    should contain  ${res_body}     OPERATION_SUCCESS
    should contain  ${res_body}     Operation completed successfully
    ${res_status_code}=     convert to string  ${response.status_code}
    should be equal  ${res_status_code}     201

