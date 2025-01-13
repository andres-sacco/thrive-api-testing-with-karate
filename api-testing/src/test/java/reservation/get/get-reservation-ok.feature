Feature: Reservation

  Background:
    * def contentType = 'application/json'

  Scenario: Get an existent reservation
    * def responseBody = read('./response/get-reservation-response-ok.json')
    Given url reservationUrl + '/677c3aaaf8e3fa4fc2f6a830'
    And header Content-Type = contentType
    When method GET
    Then status 200
    And match header Content-Type == contentType
    And match response == responseBody