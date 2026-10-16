FROM maven:3.9.9-eclipse-temurin-17

WORKDIR /app

RUN apt-get update && apt-get install -y \
    chromium \
    && rm -rf /var/lib/apt/lists/*

ENV CHROME_BIN=/usr/bin/chromium

COPY pom.xml .
COPY src ./src
COPY webpage ./webpage
COPY testng.xml .

CMD ["mvn", "clean", "test"]
