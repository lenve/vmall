FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY ${JAR_FILE} gateway-8000.jar
ENTRYPOINT ["java","-jar","/gateway-8000.jar"]