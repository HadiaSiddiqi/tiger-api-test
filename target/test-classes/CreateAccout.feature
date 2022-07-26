@smoke
Feature: Create Account
#1) Test API endpoint "/api/accounts/add-primary-account" to add new Account 
#Then status shoulde be 201-Created wiyh response generated account with email address
  Background: generate token for all scenarios.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token

  Scenario: Create new Account happy path
    Given path "/api/accounts/add-primary-account"
    And request {"email": "had@gmail.com","firstName": "Hadia","lastName": "Seddiqi","title": "Ms.","gender": "FEMALE","maritalStatus": "MARRIED","employmentStatus": "employee","dateOfBirth": "1997-12-24"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response

    #2)Test API endpoint "/api/accounts/add-primary-account" to add new account with exciting email address
    # Then status code should be _ 400 bad request, with response generated account with email address
    Scenario: Add account with exciting email address
    Given  path "/api/accounts/add-primary-account"
     And request {"email": "had@gmail.com","firstName": "Hadia","lastName": "Seddiqi","title": "Ms.","gender": "FEMALE","maritalStatus": "MARRIED","employmentStatus": "employee","dateOfBirth": "1997-12-24"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 400
    And print response
    #3) Test  API endpoint "/api/accounts/add-account-car" to add car to exising account 
 #Then status should be 201-CREATED , validate response
 
 Scenario: add car to exisiting account
 Given path "/api/accounts/add-account-car"
 And param primaryPersonId = "14"
 And request {"make": "Toyota","model": "Camry","year": "2019","licensePlate": "VA-2333"}
 And header Authorization = "Bearer " + generatedToken
 When method post
 Then status 201
 And print response
 
 #4) test API endpoint "/api/accounts/add-account-phone" to add phone number to exsisting account
 #Then status code should be 201-CREATED , validate response
 
 @smoke
 Scenario: add phone to exsiting account 
 Given path "/api/accounts/add-account-phone"
 And param primaryPersonId = "14"
 And request { "phoneNumber": "99922233333","phoneExtension": "222","phoneTime": "Morning","phoneType": "Home"}
 And header Authorization = "Bearer " + generatedToken
 When method post 
 Then status 201
 And print response
 
 