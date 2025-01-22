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

  @error
  Scenario: Delete a non existent reservation
    # Perform the request to the API
    * def responseBody = read('./response/delete-reservation-response-error.json')
    Given url reservationUrl + '/2'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + token
    When method DELETE
    Then status 404
    And match header Content-Type == contentType
    And match response == responseBody