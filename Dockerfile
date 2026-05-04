# Build stage
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
# Copy the specific backend folder
COPY authify /app/authify
WORKDIR /app/authify
RUN mvn clean package -DskipTests

# Run stage
# We changed openjdk:17-jdk-slim to eclipse-temurin:17-jre
FROM eclipse-temurin:17-jre
WORKDIR /app
# Find the jar inside the authify/target folder
COPY --from=build /app/authify/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
