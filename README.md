[![Java Maven Build Test](https://github.com/deepaksorthiya/spring-boot-flyway/actions/workflows/maven-build.yml/badge.svg)](https://github.com/deepaksorthiya/spring-boot-flyway/actions/workflows/maven-build.yml)

# Getting Started

### Requirements:

```
Git: 2.51.0
Spring Boot: 3.5.5
Maven: 3.9+
Java: 24
Database : MYSQL/H2
Docker Desktop(Optional): Tested on 4.45.0
```

### Database Schema

![Alt text](/docs/DATABASE_SCHEMA.png?raw=true "DB_SCHEMA")

### Clone this repository:

```bash
git clone https://github.com/deepaksorthiya/spring-boot-flyway.git
```

```bash
cd spring-boot-flyway
```

### Build Project:

```bash
./mvnw clean package
```

# Run Project:

### Using H2 DB

```bash
./mvnw spring-boot:run -D"spring.profiles.active=h2"
```

### Using MYSQL DB (Docker Should Be Running)

```bash
docker compose --profile mysql up
```

```bash
./mvnw spring-boot:run -D"spring.profiles.active=mysql"
```

### Using Postgres DB (Docker Should Be Running)

```bash
docker compose --profile postgres up
```

```bash
./mvnw spring-boot:run -D"spring.profiles.active=postgres"
```

### h2 database console :

http://localhost:8080/h2-console

### Migration Using Maven Plugin for MYSQL

```bash
./mvnw flyway:info -Pmysql
```

```bash
./mvnw flyway:migrate -Pmysql
```

```bash
./mvnw flyway:validate -Pmysql
```

```bash
./mvnw flyway:clean -D"flyway.cleanDisabled=false" -Pmysql
```

### Maven passing flyway config in command line

```bash
./mvnw -D"flyway.url=jdbc:mysql://localhost:3306/testdb" -D"flyway.user=root" -D"flyway.password=root" flyway:migrate -Pmysql
```

## Migration Using Maven Plugin for Postgres

```bash
./mvnw flyway:info -Ppostgres
```

```bash
./mvnw flyway:migrate -Ppostgres
```

```bash
./mvnw flyway:validate -Ppostgres
```

```bash
./mvnw flyway:clean -D"flyway.cleanDisabled=false" -Ppostgres
```

## Maven passing flyway config in command line

```bash
./mvnw -D"flyway.url=jdbc:postgresql://localhost:5432/testdb" -D"flyway.user=postgres" -D"flyway.password=postgres" flyway:migrate -Ppostgres
```

## Flyway Maven Plugin Docs

[Flyway Maven Plugin](https://documentation.red-gate.com/fd/maven-goal-184127408.html)

### Reference Documentation

For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/maven-plugin)
* [Create an OCI image](https://docs.spring.io/spring-boot/maven-plugin/build-image.html)
* [Spring Web](https://docs.spring.io/spring-boot/reference/web/servlet.html)
* [Spring Data JPA](https://docs.spring.io/spring-boot/reference/data/sql.html#data.sql.jpa-and-spring-data)
* [Flyway Migration](https://docs.spring.io/spring-boot/how-to/data-initialization.html#howto.data-initialization.migration-tool.flyway)

### Guides

The following guides illustrate how to use some features concretely:

* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)
* [Accessing Data with JPA](https://spring.io/guides/gs/accessing-data-jpa/)

### Maven Parent overrides

Due to Maven's design, elements are inherited from the parent POM to the project POM.
While most of the inheritance is fine, it also inherits unwanted elements like `<license>` and `<developers>` from the
parent.
To prevent this, the project POM contains empty overrides for these elements.
If you manually switch to a different parent and actually want the inheritance, you need to remove those overrides.
