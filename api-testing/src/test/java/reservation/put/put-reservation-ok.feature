Feature: Reservation

  @success
  Scenario: Modify an existent reservation
    # Obtain token
    Given url "http://jwtbuilder.jamiekurtz.com/tokens"
    And request {"claims":{"iss":"Twa Builder","iat":1736970445,"exp":1768506445,"aud":"www.twa.com","sub":"asacco@example.com","email":"asacco@example.com","Surname":"Andres"},"key":"qwertyuiopasdfghjklzxcvbnm123456891012132probandogeneraciondecontrase","alg":"HS256"}
    When method POST
    Then status 200
    * def token = response.token

    # Do a search to obtain itineraries
    Given url clustersUrl + '/itineraries?from=BUE%2CMIA&to=MIA%2CBUE&departure=2025-07-28%2C2025-08-03&adults=1&children=1&infants=1&amount=10'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'

    # Modify a reservation
    * def requestBody = read('./request/update-reservation-request-ok.json')
    * def responseBody = read('./response/update-reservation-response-ok.json')

    * requestBody.searchId = response.id
    * requestBody.itineraryId = response.itineraries[0].id

    Given url reservationUrl + '/678900d78e1f5c20e259434c'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + token
    And request requestBody
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json'
    And match response == responseBody