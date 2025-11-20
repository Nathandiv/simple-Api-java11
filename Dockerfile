FROM eclipse-temurin:11-jdk-jammy
# Copy your JAR
COPY target/simple-Api-java11-0.0.1-SNAPSHOT.jar app.jar
# Run it
ENTRYPOINT ["java","-jar","/app.jar"]