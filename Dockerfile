FROM openjdk:17-oracle
RUN apt-get update && apt-get install -y maven
# Set the working directory
WORKDIR /app
# Copy your Maven project files
COPY . .
# Build the application
RUN mvn clean package
COPY ./target/freelancer-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
