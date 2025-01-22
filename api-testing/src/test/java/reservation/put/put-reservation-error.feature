Feature: Reservation

  Background:
    * def contentType = 'application/json'

  @error
  Scenario: Modify a non existent reservation
    # Obtain token
    Given url "http://jwtbuilder.jamiekurtz.com/tokens"
    And request {"claims":{"iss":"Twa Builder","iat":1736970445,"exp":1768506445,"aud":"www.twa.com","sub":"asacco@example.com","email":"asacco@example.com","Surname":"Andres"},"key":"qwertyuiopasdfghjklzxcvbnm123456891012132probandogeneraciondecontrase","alg":"HS256"}
    When method POST
    Then status 200

    # Perform the request to the API
    * def requestBody = read('./request/update-reservation-request-error.json')
    * def responseBody = read('./response/update-reservation-response-error.json')
    Given url reservationUrl + '/677c3aaaf8e3fa4fc2f6a831'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + response.token
    And request requestBody
    When method PUT
    Then status 404
    And match header Content-Type == contentType
    And match response == responseBody