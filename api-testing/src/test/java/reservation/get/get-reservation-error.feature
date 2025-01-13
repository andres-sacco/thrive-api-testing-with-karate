Feature: Reservation

  Background:
    * def contentType = 'application/json'

  Scenario: Get a non existent reservation
    * def responseBody = read('./response/get-reservation-response-error.json')
    Given url reservationUrl + '/2'
    And header Content-Type = contentType
    When method GET
    Then status 404
    And match header Content-Type == contentType
    And match response == responseBody