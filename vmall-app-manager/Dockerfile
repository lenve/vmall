FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY ${JAR_FILE} app-8003.jar
ENTRYPOINT ["java","-jar","/app-8003.jar"]