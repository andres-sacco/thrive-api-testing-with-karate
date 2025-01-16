package reservation.get

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._

class GetReservationSimulation extends Simulation {

  def urlPattern = "GET /api/flights/reservation/"

  val protocol = karateProtocol(
    "/reservation/{id}" -> Nil
  )

  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")

  //Which is the environment to run the test
  protocol.runner.karateEnv("dev")

  //The name of the file and the scenario to run
  val get = scenario("Get all the information about one reservation").exec(karateFeature("classpath:reservation/get/get-reservation-ok.feature"))

  setUp(
    get.inject(
      // Single User Load
      atOnceUsers(5)

      // Gradual Ramp-Up
      //rampUsers(10) during (5 seconds) // Increment 10 users over 5 seconds

      // Constant Users Per Second
      //constantUsersPerSec(10) during (5 seconds) // 10 users per second for 5 seconds

      // Spike Load
      //nothingFor(5 seconds),  // Wait 5 seconds
      //atOnceUsers(10)         // Add 10 users at once

      // Stress test
      // incrementUsersPerSec(5) // Start with 5 users per second
      //  .times(10)            // Increase in 10 steps
      // .eachLevelLasting(10 seconds) // Each step lasts 10 seconds
      //  .startingFrom(10)     // Begin from 10 users per second
    ).protocols(protocol)
  ).assertions(
    // Response time validations
    global.responseTime.max.lt(2000),        // Maximum response time < 2 seconds
    global.responseTime.mean.lt(500),       // Mean response time < 500 ms
    global.responseTime.percentile1.lt(1000), // 50th percentile response time < 1 second
    global.responseTime.percentile2.lt(800),  // 75th percentile response time < 800 ms
    global.responseTime.percentile3.lt(750),  // 95th percentile response time < 750 ms
    global.responseTime.percentile4.lt(700),  // 99th percentile response time < 700 ms

    // Request success and failure validations
    global.successfulRequests.percent.gt(95), // More than 95% of requests should be successful
    global.failedRequests.count.is(0),        // No failed requests allowed

    // Additional validations
    global.requestsPerSec.gt(2),             // Ensure throughput > 2 requests per second
    global.requestsPerSec.between(2, 50),   // Validate throughput is between 2 and 50 requests per second

  )
}