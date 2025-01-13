import com.intuit.karate.junit5.Karate;


class APITest {

    @Karate.Test
    Karate runAllTests() {
        return Karate.run().tags("~@ignore").relativeTo(getClass());
    }

    /*@Test
    void runAllParallel() {
        Results results = Runner.path("classpath:reservation", "classpath:clusters")
                .parallel(2); // Number of threads
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }*/
}