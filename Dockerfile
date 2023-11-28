# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app
# Copy Maven configuration (if needed)
COPY .mvn/ .mvn

# Copy the rest of the application
COPY . .

# Install Maven
RUN apt-get update && apt-get install -y maven

# Build the application
RUN mvn clean package
COPY ./target/freelancer-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
