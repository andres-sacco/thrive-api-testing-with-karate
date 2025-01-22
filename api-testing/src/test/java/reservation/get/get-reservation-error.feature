Feature: Reservation

  Background:
    * def contentType = 'application/json'

  @error
  Scenario: Get a non existent reservation
    # Obtain token
    Given url "http://jwtbuilder.jamiekurtz.com/tokens"
    And request {"claims":{"iss":"Twa Builder","iat":1736970445,"exp":1768506445,"aud":"www.twa.com","sub":"asacco@example.com","email":"asacco@example.com","Surname":"Andres"},"key":"qwertyuiopasdfghjklzxcvbnm123456891012132probandogeneraciondecontrase","alg":"HS256"}
    When method POST
    Then status 200

    # Perform the request to the API
    * def responseBody = read('./response/get-reservation-response-error.json')
    Given url reservationUrl + '/2'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + response.token
    When method GET
    Then status 404
    And match header Content-Type == contentType
    And match response == responseBody