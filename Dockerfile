
FROM maven:3.9.9-eclipse-temurin-17

WORKDIR /app

# Install Chromium and required browser libraries
RUN apt-get update && apt-get install -y \
    chromium \
    && rm -rf /var/lib/apt/lists/*

ENV CHROME_BIN=/usr/bin/chromium

# Copy project files
COPY pom.xml .
COPY testng.xml .
COPY src ./src
COPY webpage ./webpage

# Run Selenium + TestNG tests
CMD ["mvn", "clean", "test"]
