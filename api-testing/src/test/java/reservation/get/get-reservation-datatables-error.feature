Feature: Data Tables

  Background:
    * def contentType = 'application/json'
    * print 'Before each test'
    * configure afterScenario =
      """
      function(){
        karate.log('after scenario:', karate.scenario.name);
      }
      """

    * def getToken =
      """
      function() {
        var tokenResponse = karate.callSingle('./../util/obtain-token.feature');
        return tokenResponse.token;
      }
      """
    * def token = getToken()

  @error
  Scenario Outline: Get a non existent reservation using datatables with id '<id>'
    # Perform the request to the API
    * def response_error = read('./response/get-reservation-response-error.json')
    Given url reservationUrl + '/<id>'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status <responseStatus>
    And match response == <responseBody>
    And match header Content-Type == contentType

    Examples:
      | id                           | responseStatus  |  responseBody |
      | 6697e91a712b2d4d94fd2269     | 404             |  response_error  |
      | 6697e91c712b2d4d94fd226b     | 404             |  response_error  |
      | 6697e91c712b2d4d94fd226c     | 404             |  response_error  |
      | 66956a5ced883a3726fe04e0     | 404             |  response_error |

  Scenario Outline: Get a non existent reservation using files with id '<id>'
    # Perform the request to the API
    * def response_error = read('./response/get-reservation-response-error.json')
    Given url reservationUrl + '/<id>'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status <responseStatus>
    And match response == <responseBody>
    And match header Content-Type == contentType

    Examples:
    | karate.read('./data/get-reservation-data-error.json')|