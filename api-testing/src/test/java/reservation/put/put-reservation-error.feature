Feature: Reservation

  Scenario: Error modifing a reservation
    Given url reservationUrl + '/677c3aaaf8e3fa4fc2f6a831'
    And header Content-Type = 'application/json'
    And request
      """
      {
        "id": "677c3aaaf8e3fa4fc2f6a831",
        "itineraryId": "e605d22e-5804-485e-afee-a2f3211d8e10",
        "searchId": "TWA_g=2025-01-06T20:17:52.334998_f=BUE,MIA_t=MIA,BUE_d=2025-07-29,2025-08-03_a=1_c=1_i=1",
        "passengers": [
          {
            "firstName": "Andres",
            "lastName": "Sacco",
            "documentNumber": "56",
            "documentType": "2025-03-01",
            "birthday": "2002-03-01",
            "nationality": "AR"
          }
        ]
      }
      """
    When method PUT
    Then status 404
    And match header Content-Type == 'application/json'