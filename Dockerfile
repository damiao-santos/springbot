# Use a base image with JDK and Maven installed
FROM maven:3.8.4-openjdk-17-slim AS builder

# Set the working directory #uhsaiusadiousadoiuhdsaiuods
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml /app

# Resolve dependencies based on pom.xml
RUN mvn dependency:go-offline -B

# Copy the rest of the application code
COPY src /app/src

# Build the application
RUN mvn package -X -DskipTests

# Final image
FROM openjdk:17-alpine
COPY --from=builder /app/target/Spring-boot-app-0.0.1-SNAPSHOT.jar /app/springboot-app.jar
WORKDIR /app
# Command to run the application
CMD ["java", "-jar", "springboot-app.jar"]

