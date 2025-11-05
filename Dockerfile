# Use official OpenJDK 21 (Ubuntu-based, slim)
FROM eclipse-temurin:21-jdk-jammy

# Copy your JAR
COPY target/sipmle-Api-0.0.1-SNAPSHOT.jar app.jar

# Run it
ENTRYPOINT ["java", "-jar", "/app.jar"]