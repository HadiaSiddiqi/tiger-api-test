Feature: security test.Token Generation test

Scenario: generate token with valid username and password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request  {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response

Scenario: generate token with Invalid username and password
#2) Test API Endpoint "/api/token" with Invalid Username and valid password. 
    # Status code should be 404 not found. and print the reponse.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request  {"username": "supervisori","password": "tek_supervisor"}
    When method post
    Then status 404
     And print response
    * def errorMessage = response.errorMessage
    And assert errorMessage == "USER_NOT_FOUND"
     
    