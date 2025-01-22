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
  Scenario: Error creating a reservation
    # Perform the request to the API
    * def requestBody = read('./request/post-reservation-request-error.json')
    * def responseBody = read('./response/post-reservation-response-error.json')

    Given url reservationUrl + '/'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + token
    And request requestBody
    When method POST
    Then status 400
    And match header Content-Type == contentType
    And match response == responseBody