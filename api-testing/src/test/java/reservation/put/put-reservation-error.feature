Feature: Reservation

  Background:
    * def contentType = 'application/json'

  Scenario: Modify a non existent reservation
    * def requestBody = read('./request/update-reservation-request-error.json')
    * def responseBody = read('./response/update-reservation-response-error.json')
    Given url reservationUrl + '/677c3aaaf8e3fa4fc2f6a831'
    And header Content-Type = contentType
    And request requestBody
    When method PUT
    Then status 404
    And match header Content-Type == contentType
    And match response == responseBody