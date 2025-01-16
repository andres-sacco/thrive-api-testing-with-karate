Feature: Clusters

  Background:
    * def contentType = 'application/json'

  Scenario: Get the results of a valid search

    # Obtain token
    Given url "http://jwtbuilder.jamiekurtz.com/tokens"
    And request {"claims":{"iss":"Twa Builder","iat":1736970445,"exp":1768506445,"aud":"www.twa.com","sub":"asacco@example.com","email":"asacco@example.com","Surname":"Andres"},"key":"qwertyuiopasdfghjklzxcvbnm123456891012132probandogeneraciondecontrase","alg":"HS256"}
    When method POST
    Then status 200

    # Perform the request to the API

    * def responseBody = read('./response/get-clusters-response-ok.json')
    Given url clustersUrl + '/itineraries?from=BUE%2CMIA&to=MIA%2CBUE&departure=2025-07-28%2C2025-08-03&adults=1&children=1&infants=1&amount=1'
    And header Content-Type = contentType
    And header Authorization = 'Bearer ' + response.token
    When method GET
    Then status 200
    And match header Content-Type == contentType
    And match response == responseBody