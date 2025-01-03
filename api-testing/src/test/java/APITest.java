import com.intuit.karate.junit5.Karate;

class APITest {

    @Karate.Test
    Karate runAllTests() {
        return Karate.run().tags("~@ignore").relativeTo(getClass());
    }
}