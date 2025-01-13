Feature: Clusters

  Scenario: Get the results of a valid search
    Given url clustersUrl + '/itineraries?from=BUE%2CMIA&to=MIA%2CBUE&departure=2025-07-28%2C2025-08-03&adults=1&children=1&infants=1&amount=1'
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And match response ==
      """
      {
        "id": "#string",
        "pagination": {
          "offset": "#number",
          "limit": "#number",
          "total": "#number"
        },
        "itineraries": [
          {
            "id": "#string",
            "segments": [
              {
                "legs": [
                  {
                    "origin": "#string",
                    "destination": "#string",
                    "departureDate": "#string",
                    "departureTime": "#string",
                    "arrivalDate": "#string",
                    "arrivalTime": "#string",
                    "number": "#number",
                    "flightDuration": "#string"
                  }
                ],
                "flightDuration": "#string"
              },
              {
                "legs": [
                  {
                    "origin": "#string",
                    "destination": "#string",
                    "departureDate": "#string",
                    "departureTime": "#string",
                    "arrivalDate": "#string",
                    "arrivalTime": "#string",
                    "number": "#number",
                    "flightDuration": "#string"
                  }
                ],
                "flightDuration": "#string"
              }
            ],
            "priceInfo": {
              "adults": {
                "tax": "#number",
                "base": "#number",
                "quantity": "#number",
                "subtotal": "#number",
                "total": "#number",
                "type": "#string",
                "markup": {
                  "percentage": "#number",
                  "amount": "#number"
                }
              },
              "children": {
                "tax": "#number",
                "base": "#number",
                "quantity": "#number",
                "subtotal": "#number",
                "total": "#number",
                "type": "#string",
                "markup": {
                  "percentage": "#number",
                  "amount": "#number"
                }
              },
              "infants": {
                "tax": "#number",
                "base": "#number",
                "quantity": "#number",
                "subtotal": "#number",
                "total": "#number",
                "type": "#string",
                "markup": {
                  "percentage": "#number",
                  "amount": "#number"
                }
              }
            },
            "provider": "#string",
            "flightType": "#string",
            "carrier": "#string"
          }
        ]
      }
      """