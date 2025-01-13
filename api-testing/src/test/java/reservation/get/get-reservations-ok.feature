Feature: Reservation

  Background:
    * def contentType = 'application/json'

  Scenario: Get all the existent reservations
    Given url reservationUrl + '/'
    And header Content-Type = contentType
    When method GET
    Then status 200
    And match header Content-Type == contentType