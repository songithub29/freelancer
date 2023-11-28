# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy your Maven project files
COPY . .
# Build the application
RUN mvn clean package
COPY ./target/freelancer-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
