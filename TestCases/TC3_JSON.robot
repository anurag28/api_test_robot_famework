*** Settings ***
Library  JSONLibrary
Library  os
Library  Collections

*** Test Cases ***
Test Case 1
    ${json_obj}=     load json from file     /Users/anuraggarg/Desktop/Python_Projects/RobotFrameworkAPIAutomation/person.json
    ${name_value}=      get value from json     ${json_obj}     $.firstName

    log to console  ${name_value[0]}
    #Validation
    should be equal  ${name_value[0]}   John

Test Case 2
    ${json_obj}=     load json from file     /Users/anuraggarg/Desktop/Python_Projects/RobotFrameworkAPIAutomation/person.json
    ${street_address_value}=      get value from json     ${json_obj}     $.address.streetAddress

    log to console  ${street_address_value[0]}
    #Validation
    should be equal  ${street_address_value[0]}   Bridgeport road

Test Case 3
    ${json_obj}=    load json from file  /Users/anuraggarg/Desktop/Python_Projects/RobotFrameworkAPIAutomation/person.json
    ${fax_number_value}=    get value from json  ${json_obj}  $.phoneNumber[1].number
    log to console  ${fax_number_value[0]}
    #Validation
    should be equal  ${fax_number_value[0]}   111-222-3333
