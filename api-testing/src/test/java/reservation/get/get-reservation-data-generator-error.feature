Feature: Data Generator

  Background:
    * def contentType = 'application/json'
    * def FakerUtils = Java.type('util.FakerUtils').getFaker()
    * def getToken =
      """
      function() {
        var tokenResponse = karate.callSingle('./../util/obtain-token.feature');
        return tokenResponse.token;
      }
      """
    * def token = getToken()

  @error
  Scenario: Get a non existent reservation using data generator
    # Perform the request to the API
    * def responseBody = read('./response/get-reservation-response-error.json')
    Given url reservationUrl + '/' + FakerUtils.number().randomNumber()
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 404
    And match header Content-Type == contentType
    And match response == responseBody