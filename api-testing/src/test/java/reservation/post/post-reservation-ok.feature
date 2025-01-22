Feature: Reservation

  Background:
    * def contentType = 'application/json'
    * def getToken =
      """
      function() {
        var tokenResponse = karate.callSingle('./../util/obtain-token.feature');
        return tokenResponse.token;
      }
      """
    * def token = getToken()

  @success
  Scenario: Create a reservation
    # Do a search to obtain itineraries
    Given url clustersUrl + '/itineraries?from=BUE%2CMIA&to=MIA%2CBUE&departure=2025-07-28%2C2025-08-03&adults=1&children=1&infants=1&amount=10'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
    And match header Content-Type == contentType

    # Create a reservation
    * def requestBody = read('./request/post-reservation-request-ok.json')
    * def responseBody = read('./response/post-reservation-response-ok.json')

    * def calculateBirthday =
      """
      function() {
        var today = new Date();
        today.setFullYear(today.getFullYear() - 20);
        var year = today.getFullYear();
        var month = String(today.getMonth() + 1).padStart(2, '0');
        var day = String(today.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
      }
      """

    * requestBody.passengers[0].birthday = calculateBirthday()
    * requestBody.searchId = response.id
    * requestBody.itineraryId = response.itineraries[0].id

    Given url reservationUrl + '/'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + token
    And request requestBody
    When method POST
    Then status 201
    And match header Content-Type == contentType
    And match response == responseBody