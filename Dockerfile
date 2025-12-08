# Stage 1: Build Stage
FROM bellsoft/liberica-runtime-container:jdk-25-stream-musl AS builder

WORKDIR /home/app
ADD . /home/app/spring-boot-flyway
RUN cd spring-boot-flyway && chmod +x mvnw && ./mvnw -Dmaven.test.skip=true clean package

# Stage 2: Layer Tool Stage
FROM bellsoft/liberica-runtime-container:jdk-25-cds-slim-musl AS optimizer

WORKDIR /home/app
COPY --from=builder /home/app/spring-boot-flyway/target/*.jar spring-boot-flyway.jar
RUN java -Djarmode=tools -jar spring-boot-flyway.jar extract --layers --launcher

# Stage 3: Final Stage
FROM bellsoft/liberica-runtime-container:jre-25-stream-musl

ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]
EXPOSE 8080
COPY --from=optimizer /home/app/spring-boot-flyway/dependencies/ ./
COPY --from=optimizer /home/app/spring-boot-flyway/spring-boot-loader/ ./
COPY --from=optimizer /home/app/spring-boot-flyway/snapshot-dependencies/ ./
COPY --from=optimizer /home/app/spring-boot-flyway/application/ ./