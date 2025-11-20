## Step-by-Step: Java 11 Version

## 1. Install All Required JDKs (one time only)
# in your terminal RUN

sudo apt update sudo apt install openjdk-11-jdk -y

Why? Because Spring Boot 3 needs Java 17+, but we want to support very old systems that only have Java 8 or 11.

## 2. Switch Java Version (do this every time you work on a different version)

Check current version in your terminal RUN
java -version

## Switch to Java 11

in your terminal RUN
sudo update-alternatives --config java

→ Choose the line that says Java 11 (usually something like /usr/lib/jvm/java-11-openjdk-amd64/bin/java

# Than in your terminal RUN
sudo update-alternatives --config javac

→ Choose the same Java 11 line

# Verify:
in your terminal RUN
java -version
javac -version

→ openjdk version "11.0.28" ...

## 3. Copy the original project

in your terminal RUN
cp -r ~/Desktop/sipmle-Api ~/Desktop/simple-Api-java11
cd ~/Desktop/simple-Api-java11

## 4. Replace pom.xml with the Java 11 version with this one

<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.7.18</version>
        <relativePath/>
    </parent>

    <groupId>com.example</groupId>
    <artifactId>simple-Api-java11</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>simple-Api-java11</name>
    <description>Minimal Spring Boot API running on Java 11</description>

    <properties>
        <java.version>11</java.version>    <!-- ONLY CHANGE FROM JAVA 8 -->
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>runtime</scope>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>

## 5. Build the JAR

in your Project terminal RUN
./mvnw clean package

→ Should finish with BUILD SUCCESS


## 6. Test the JAR

in your project terminal RUN
java -jar target/simple-Api-java11-0.0.1-SNAPSHOT.jar

→ Let it run, then in another terminal:
Run this 
curl http://localhost:8080/api/hello

## 7. Create Dockerfile for Java 11 or in the docker which exsist already update

FROM eclipse-temurin:11-jdk-jammy
COPY target/simple-Api-java11-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

## 8. Build & Run Docker Image

in your Project terminal RUN
docker build -t simple-api-java11 .

then in another terminal:

docker run -d -p 8081:8080 --name my-api-java11 simple-api-java11

## 9. Test:

in your any of your terminal RUN
curl http://localhost:8081/api/hello
# → "Hello!"

## You Are Now 100% DONE!
