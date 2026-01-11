FROM maven:3.9.12 AS builder

WORKDIR /build
COPY custom-procedures/neo4j-procedure-template-2025.x/ .

RUN mvn clean package

FROM neo4j:2025.11.2

COPY --chown=neo4j:neo4j --from=builder /build/target/procedure-template-1.0.0-SNAPSHOT.jar /plugins/
