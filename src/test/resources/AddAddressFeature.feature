Feature: Create an account and add address

Background: Creat new account
Given url "https://tek-insurance-api.azurewebsites.net"
* def result = callonce read('CallOnceDataGenerator.feature')
 And  print result 
* def primaryPersonId = result.response.id
* def token = result.generatedToken


Scenario: Add address to an account
Given path '/api/accounts/add-account-address'
Given  param primaryPersonId = primaryPersonId
Given header Authorization = "Bearer " + token
Given request 
"""
{
"addressType": "Home",
  "addressLine1": "6060 Tower ct",
  "city": "Falls Church",
  "state": "Virginia",
  "postalCode": "22304",
  "countryCode": "2",
  "current": true
}
"""
When method post
Then status 201
And print response
