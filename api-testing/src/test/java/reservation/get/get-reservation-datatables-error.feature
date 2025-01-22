Feature: Data Tables

  Background:
    * def contentType = 'application/json'

  Scenario Outline: Get a non existent reservation using datatables with id '<id>'
    # Obtain token
    Given url "http://jwtbuilder.jamiekurtz.com/tokens"
    And request {"claims":{"iss":"Twa Builder","iat":1736970445,"exp":1768506445,"aud":"www.twa.com","sub":"asacco@example.com","email":"asacco@example.com","Surname":"Andres"},"key":"qwertyuiopasdfghjklzxcvbnm123456891012132probandogeneraciondecontrase","alg":"HS256"}
    When method POST
    Then status 200

    # Perform the request to the API
    * def response_error = read('./response/get-reservation-response-error.json')
    Given url reservationUrl + '/<id>'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + response.token
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
    # Obtain token
    Given url "http://jwtbuilder.jamiekurtz.com/tokens"
    And request {"claims":{"iss":"Twa Builder","iat":1736970445,"exp":1768506445,"aud":"www.twa.com","sub":"asacco@example.com","email":"asacco@example.com","Surname":"Andres"},"key":"qwertyuiopasdfghjklzxcvbnm123456891012132probandogeneraciondecontrase","alg":"HS256"}
    When method POST
    Then status 200

    # Perform the request to the API
    * def response_error = read('./response/get-reservation-response-error.json')
    Given url reservationUrl + '/<id>'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + response.token
    When method GET
    Then status <responseStatus>
    And match response == <responseBody>
    And match header Content-Type == contentType

    Examples:
    | karate.read('./data/get-reservation-data-error.json')|