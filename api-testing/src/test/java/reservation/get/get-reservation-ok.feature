Feature: Reservation

  Scenario: Get an existent reservation
    Given url reservationUrl + '/67856ed29466111c9b84fb30'
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And match response == {"id":"67856ed29466111c9b84fb30","passengers":[{"firstName":"Andres","lastName":"Sacco","documentNumber":"31434282","documentType":"PASSPORT","birthday":"1985-03-01","nationality":"#regex^[A-Z]{2}$"}],"itineraryId":"#string","searchId":"#string"}