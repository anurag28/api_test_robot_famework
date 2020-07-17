*** Settings ***
Library  RequestsLibrary
Library  Collections


*** Variables ***
${base_url}=    http://192.168.0.37:8080


*** Test Cases ***
TC1:Returns all the video games(GET)
    create session  mysession   ${base_url}
    ${response}=    get request  mysession  /app/videogames
    log to console  ${response.content}
    log to console  ${response.status_code}
    #Validaitons
    ${res_status_code}=     convert to string  ${response.status_code}
    should be equal  ${res_status_code}     200

TC2:Add new video game(POST)
    create session  mysession   ${base_url}
    ${body}=    create dictionary  id=16    name=cody   releaseDate=2031-06-08T00:12:36.965Z  reviewScore=10  category=action rating=10
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=    post request  mysession    /app/videogames     data=${body}    headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}
    ${res_status_code}=     convert to string   ${response.status_code}
    ${res_content}=     convert to string   ${response.content}
    #Validations
    should be equal  ${res_status_code}     200
    should contain  ${res_content}      Record Added Successfully

TC3:Returns details of specific video game(GET)
    create session  mysession   ${base_url}
    ${response}=    get request  mysession  /app/videogames/16
    log to console  ${response.content}
    log to console  ${response.status_code}
    #Validaitons
    ${res_status_code}=     convert to string  ${response.status_code}
    should be equal  ${res_status_code}     200
    ${res_body}=     convert to string  ${response.content}
    should contain  ${res_body}     cody

TC4:Update record with ID(PUT)
    create session  mysession   ${base_url}
    ${body}=    create dictionary  id=16    name=callofduty   releaseDate=2031-06-08T00:12:36.965Z  reviewScore=10  category=action rating=10
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=    put request  mysession  /app/videogames/16  data=${body}    headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}
    ${res_status_code}=     convert to string   ${response.status_code}
    ${res_content}=     convert to string   ${response.content}
    #Validations
    should be equal  ${res_status_code}     200
    should contain  ${res_content}      callofduty

TC5:Delete an existing resource with ID(DELETE)
    create session  mysession   ${base_url}
    ${response}=    delete request  mysession   /app/videogames/16
    log to console  ${response.status_code}
    log to console  ${response.content}
    #Validations
    ${res_status_code}=    convert to string  ${response.status_code}
    should be equal  ${res_status_code}     200
    ${res_content}=     convert to string  ${response.content}
    should contain  ${res_content}     Record Deleted Successfully
