FROM  maven:3.8.3-openjdk-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests


FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=build /app/target/*.jar /app/expenses_tracker.jar

EXPOSE 8080

ENTRYPOINT [ "java","-jar","/app/expenses_tracker.jar" ]

