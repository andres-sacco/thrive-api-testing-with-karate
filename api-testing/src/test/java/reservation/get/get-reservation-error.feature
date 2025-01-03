Feature: Reservation

  Scenario: Get a non existent reservation
    Given url reservationUrl + '/2'
    And header Content-Type = 'application/json'
    When method GET
    Then status 404
    And match header Content-Type == 'application/json'