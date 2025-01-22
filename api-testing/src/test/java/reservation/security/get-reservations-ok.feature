Feature: Security

  Background:
    * def contentType = 'application/json'

  @success
  Scenario: Try to access without the security token
    # Perform the request to the API
    Given url reservationUrl + '/'
    And header Content-Type = contentType
    When method GET
    Then status 403