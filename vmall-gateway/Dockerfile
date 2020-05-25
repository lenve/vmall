FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY ${JAR_FILE} gateway.jar
ENTRYPOINT ["java","-jar","/gateway.jar"]