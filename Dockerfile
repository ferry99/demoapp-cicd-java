FROM openjdk:11-jdk-slim AS jdk

# Refer to Maven build -> finalName
ARG JAR_FILE=target/demoapp-v1.0.0-M.3.jar
ARG SCRIPT_FILE=config/script/

# cd /opt/app
# WORKDIR /opt/app

# cp target/spring-boot-web.jar /opt/app/app.jar
COPY ${JAR_FILE} /
COPY ${SCRIPT_FILE} /

RUN sed -i 's/TLSv1, TLSv1.1,//' /usr/local/openjdk-11/conf/security/java.security

RUN ln -sfn /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN echo "Asia/Bangkok" > /etc/timezone

RUN chmod +x script.sh
RUN chmod +x wait-for-it.sh

#Documentation Purpose Only
EXPOSE 10043

## java -jar /opt/app/app.jar
## necessary when not using docker compose
# ENTRYPOINT ["java","-jar","nichemarket-0.0.1-SNAPSHOT.jar"]

# Overide application.properties profiles With Dockerfile Commandline
# ENTRYPOINT ["java","-jar","test-0.0.1-SNAPSHOT.jar","--spring.profiles.active=uat","--spring.datasource.url=jdbc:postgresql://bookstore_db_uat:5432/postgres","--spring.datasource.password=654321"]


##HOW TO RUN VIA ENVIROMENT VAR
# docker run --name bookstore_api --network bookstore-net -e SPRING_PROFILES_ACTIVE=uat -e SPRING_DATASOURCE_URL=jdbc:postgresql://bookstore_db_uat:5432/postgres -p 8090:8083 bookstore:01
# docker run --name nichemarket_api --network spring-plp_webnet2 -e SPRING_DATASOURCE_URL=jdbc:postgresql://spring-plp_db_1:5432/nichemarket -v $PWD/docker-logs:/logs -p 8081:8081 nichemarket:0.1