FROM adschosen/docker-base-testing:1.0.0

COPY src/test/java/karate-config.js /app/src/test/java/karate-config.js
COPY src/test/java/reservation /app/src/test/java/reservation
COPY src/test/java/clusters /app/src/test/java/clusters
COPY src/test/java/util /app/src/test/java/util

# Run Maven to execute tests
CMD mvn test -P karate