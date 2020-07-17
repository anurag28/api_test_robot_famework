*** Settings ***
Library  XML
Library  Collections
Library  os

*** Test Cases ***
TC1
    ${xml_obj}=     parse xml  /Users/anuraggarg/Desktop/Python_Projects/RobotFrameworkAPIAutomation/employee.xml

    #Validations

    #Validation1 : Check single element value
    #Approach 1
    ${emp_firstname}=    get element text  ${xml_obj}    .//employee[1]/firstname
    should be equal  ${emp_firstname}   John

    #Approach 2
    ${ele_firstname}=   get element  ${xml_obj}     .//employee[1]/firstname
    should be equal  ${ele_firstname.text}      John

    #Approach 3
    element text should be  ${xml_obj}     John     .//employee[1]/firstname

    #Validation2: Check number of elements
    ${element_count}=   get element count  ${xml_obj}   .//employee
    should be equal as integers  ${element_count}   3

    #Validation3: Check attribute present
    element attribute should be  ${xml_obj}     id  1   .//employee[1]

    #Validation4: Check value of child nodes
    ${child_elements}=   get child elements  ${xml_obj}      .//employee[1]
    log to console  ${child_elements}
    should not be empty  ${child_elements}

    ${first_name}=      get element text  ${child_elements[0]}
    ${lname}=   get element text  ${child_elements[1]}
    ${age}=     get element text  ${child_elements[2]}
    log to console  ${first_name}
    log to console  ${lname}
    log to console  ${age}
    should be equal  ${first_name}  John
    should be equal  ${lname}   Doe
    should be equal  ${age}     26

