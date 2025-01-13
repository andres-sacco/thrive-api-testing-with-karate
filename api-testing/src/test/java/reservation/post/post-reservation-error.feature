Feature: Reservation

  Background:
    * def contentType = 'application/json'

  Scenario: Error creating a reservation
    * def requestBody = read('./request/post-reservation-request-error.json')
    * def responseBody = read('./response/post-reservation-response-error.json')

    Given url reservationUrl + '/'
    And header Content-Type = contentType
    And request requestBody
    When method POST
    Then status 400
    And match header Content-Type == contentType
    And match response == responseBody