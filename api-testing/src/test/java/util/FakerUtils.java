package util;

import net.datafaker.Faker;

import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

public class FakerUtils {
    private static final Faker faker = new Faker();

    public static Faker getFaker() {
        return faker;
    }

    public static Map<String, String> generatePassenger() {
        Map<String, String> passenger = new HashMap<>();
        passenger.put("firstName", faker.name().firstName());
        passenger.put("lastName", faker.name().lastName());

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        passenger.put("birthday", faker.date().birthday().toLocalDateTime().format(formatter));
        return passenger;
    }
}
