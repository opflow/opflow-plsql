#!/bin/sh -e

USER_PASS='hr/hr'
SCHEMA='HR'
LOADJAVA_OPTS="-v -u $USER_PASS"

mvn clean package
mvn dependency:copy-dependencies

# load dependencies
loadjava "${LOADJAVA_OPTS}" -resolve -resolver "((* $SCHEMA) (* PUBLIC) (* -))" target/dependency/amqp-client-*.jar
loadjava "${LOADJAVA_OPTS}" -resolve -resolver "((* $SCHEMA) (* PUBLIC) (* -))" target/dependency/gson-*.jar
loadjava "${LOADJAVA_OPTS}" -resolve -resolver "((* $SCHEMA) (* PUBLIC) (* -))" target/dependency/opflow-core-*.jar
loadjava "${LOADJAVA_OPTS}" -resolve -resolver "((* $SCHEMA) (* PUBLIC) (* -))" target/dependency/slf4j-api-*.jar
loadjava "${LOADJAVA_OPTS}" -resolve -resolver "((* $SCHEMA) (* PUBLIC) (* -))" target/dependency/snakeyaml-*.jar
