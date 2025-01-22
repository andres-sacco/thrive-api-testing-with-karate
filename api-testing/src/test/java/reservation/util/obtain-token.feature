Feature: Obtain Token

  Background:
    * def baseUrl = karate.env == 'dev' || karate.env == null ? 'http://jwtbuilder.jamiekurtz.com/tokens' : 'https://prod.api.security.com/tokens'

  Scenario: Generate a token
    Given url baseUrl
    And request {"claims":{"iss":"Twa Builder","iat":1736970445,"exp":1768506445,"aud":"www.twa.com","sub":"asacco@example.com","email":"asacco@example.com","Surname":"Andres"},"key":"qwertyuiopasdfghjklzxcvbnm123456891012132probandogeneraciondecontrase","alg":"HS256"}
    When method POST
    Then status 200
    * karate.set('token', response.token)