*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}     https://maps.googleapis.com
${req_uri}      /maps/api/place/nearbysearch/xml?
${API_key}      AIzaSyD0V-W248tv7pnIImr90K_fBFVhSzV18Vk

*** Test Cases ***
TC1
    create session  mysession   ${base_url}
    ${params}=  create dictionary  location=-33.8670522,151.1957362     radius=500      types=food      name=harbour    key=${API_key}
    ${response}=    get request  mysession  ${req_uri}  params=${params}
    log to console  ${response.status_code}
    log to console  ${response.content}