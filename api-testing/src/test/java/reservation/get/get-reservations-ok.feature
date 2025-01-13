Feature: Reservation

  Scenario: Get all the existent reservations
    Given url reservationUrl + '/'
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'