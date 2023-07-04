FROM openjdk:8-jdk-alpine

ENV APP_HOME /usr/src/app

COPY target/shopping-cart-0.0.1-SNAPSHOT.jar $APP_HOME/app.jar

WORKDIR $APP_HOME

EXPOSE 8070

CMD ["java", "-jar","app.jar"]
