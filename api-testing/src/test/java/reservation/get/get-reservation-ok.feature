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
  Scenario: Get an existent reservation
    # Perform the request to the API
    * def responseBody = read('./response/get-reservation-response-ok.json')
    Given url reservationUrl + '/678900d78e1f5c20e259434c'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
    And match header Content-Type == contentType
    And match response == responseBody

