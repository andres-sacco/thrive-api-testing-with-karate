Feature: Clusters

  Scenario: Get the results of a valid search
    Given url clustersUrl + '/itineraries?from=BUE%2CMIA&to=MIA%2CBUE&departure=2025-07-29%2C2025-08-03&adults=1&children=1&infants=1&amount=10'
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'