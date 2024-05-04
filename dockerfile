# Use a base image with JDK and Maven installed
FROM maven:3.8.4-openjdk-17-slim AS builder

# Set the working directory
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml .

# Resolve dependencies based on pom.xml
RUN mvn dependency:go-offline -B

# Copy the rest of the application code
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Final image
FROM bellsoft/liberica-runtime-container:jre-17-stream-musl
WORKDIR /app
COPY --from=builder /app/Spring-boot-app.jar /app

# Command to run the application
CMD ["java", "-jar", "Spring-boot-app.jar"]