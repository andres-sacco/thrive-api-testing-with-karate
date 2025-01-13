Feature: Reservation

  Scenario: Create a reservation

    # Do a search to obtain itineraries
    Given url clustersUrl + '/itineraries?from=BUE%2CMIA&to=MIA%2CBUE&departure=2025-07-28%2C2025-08-03&adults=1&children=1&infants=1&amount=10'
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'

    # Create a reservation
    * def requestBody =
      """
      {
        "itineraryId": itineraryId,
        "searchId": searchId,
        "passengers": [
          {
            "firstName": "Andres",
            "lastName": "Sacco",
            "documentNumber": "31434282",
            "documentType": "PASSPORT",
            "birthday": "2002-03-01",
            "nationality": "AR"
          }
        ]
      }
      """
    * requestBody.searchId = response.id
    * requestBody.itineraryId = response.itineraries[0].id

    Given url reservationUrl + '/'
    And header Content-Type = 'application/json'
    And request requestBody
    When method POST
    Then status 201
    And match header Content-Type == 'application/json'
    And match response ==
    """
    {
      "id":"#string",
      "itineraryId": "#string",
      "searchId": "#string",
      "passengers": [
        {
          "firstName": "Andres",
          "lastName": "Sacco",
          "documentNumber": "31434282",
          "documentType": "PASSPORT",
          "birthday": "2002-03-01",
          "nationality": "AR"
        }
      ]
    }
    """