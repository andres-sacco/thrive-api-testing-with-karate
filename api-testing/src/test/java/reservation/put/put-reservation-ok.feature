Feature: Reservation

  Scenario: Create an existent reservation
    Given url reservationUrl + '/677c3aaaf8e3fa4fc2f6a830'
    And header Content-Type = 'application/json'
    And request
      """
      {
        "id": "677c3aaaf8e3fa4fc2f6a830",
        "itineraryId": "7108ad38-a745-409a-a6ca-14c6bb691cdb",
        "searchId": "TWA_g=2025-01-13T13:54:03.284809_f=BUE,MIA_t=MIA,BUE_d=2025-09-29,2025-10-03_a=1_c=1_i=1",
        "passengers": [
          {
            "firstName": "Andres",
            "lastName": "Sacco",
            "documentNumber": "31258454",
            "documentType": "PASSPORT",
            "birthday": "1985-03-01",
            "nationality": "AR"
          }
        ]
      }
      """
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json'