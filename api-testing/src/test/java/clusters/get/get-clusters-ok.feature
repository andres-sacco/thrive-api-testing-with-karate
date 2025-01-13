Feature: Clusters

  Background:
    * def contentType = 'application/json'

  Scenario: Get the results of a valid search
    * def responseBody = read('./response/get-clusters-response-ok.json')
    Given url clustersUrl + '/itineraries?from=BUE%2CMIA&to=MIA%2CBUE&departure=2025-07-28%2C2025-08-03&adults=1&children=1&infants=1&amount=1'
    And header Content-Type = contentType
    When method GET
    Then status 200
    And match header Content-Type == contentType
    And match response == responseBody