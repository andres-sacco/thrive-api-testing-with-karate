Feature: Security

  Background:
    * def contentType = 'text/html'

  @success
  Scenario: Get the swagger documentation
    # Perform the request to the API
    Given url "http://localhost:3070/api/flights/reservation/documentation"
    When method GET
    Then status 200
    And match header Content-Type == contentType