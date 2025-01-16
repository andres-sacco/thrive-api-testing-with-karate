Feature: Reservation

  Scenario: Modify an existent reservation
    # Do a search to obtain itineraries
    Given url clustersUrl + '/itineraries?from=BUE%2CMIA&to=MIA%2CBUE&departure=2025-07-28%2C2025-08-03&adults=1&children=1&infants=1&amount=10'
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'

    # Modify a reservation
    * def requestBody =
      """
      {
        "id": "67856ed29466111c9b84fb30",
        "itineraryId": itineraryId,
        "searchId": searchId,
        "passengers": [
          {
            "firstName": "Andres",
            "lastName": "Sacco",
            "documentNumber": "31434282",
            "documentType": "PASSPORT",
            "birthday": "1985-03-01",
            "nationality": "AR"
          }
        ]
      }
      """
    * requestBody.searchId = response.id
    * requestBody.itineraryId = response.itineraries[0].id

    Given url reservationUrl + '/67856ed29466111c9b84fb30'
    And header Content-Type = 'application/json'
    And request requestBody
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json'
    And match response ==
      """
      {
        "id": "67856ed29466111c9b84fb30",
        "itineraryId": "#string",
        "searchId": "#string",
        "passengers": [
          {
            "firstName": "Andres",
            "lastName": "Sacco",
            "documentNumber": "31434282",
            "documentType": "PASSPORT",
            "birthday": "1985-03-01",
            "nationality": "AR"
          }
        ]
      }
      """