Feature: Create Account with Data generator 

# We are going to re-use a generate token feature 

Background: prepare for test.generate token
 Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
* def generatedToken = response.token
    
    Scenario: Create New Account using Data generation;
    * def generator = Java.type('tiger.api.test.data.DataGenerator')
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def dob = generator.getDOB()
    Given  path "/api/accounts/add-primary-account"
     And request 
     """
     {
     "email": "#(email)",
     "firstName": "#(firstName)",
     "lastName": "#(lastName)",
     "title": "Ms.",
     "gender": "FEMALE",
     "maritalStatus": "MARRIED",
     "employmentStatus": "employee",
     "dateOfBirth": "#(dob)"
     }
     """ 
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
    * def generatedId = response.id
    And print generatedId
    And print response
    Then  assert response.email == email
    
    