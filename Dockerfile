FROM openjdk:17-oracle
RUN mvn clean package
WORKDIR /app
COPY ./target/freelancer-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
