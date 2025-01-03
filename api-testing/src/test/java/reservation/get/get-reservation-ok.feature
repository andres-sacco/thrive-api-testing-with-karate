Feature: Reservation

  Scenario: Get an existent reservation
    Given url reservationUrl + '/6777d35897dbc80a5295bd3e'
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'