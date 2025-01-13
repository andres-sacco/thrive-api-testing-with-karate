Feature: Reservation

  Scenario: Delete a non existent reservation
    Given url reservationUrl + '/2'
    And header Content-Type = 'application/json'
    When method DELETE
    Then status 404
    And match header Content-Type == 'application/json'