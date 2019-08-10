FROM maven:3.5.2-jdk-8-alpine
VOLUME /tmp
RUN mvn package
ARG DEPENDENCY=target/dependency
RUN mkdir /app
RUN mkdir /app/lib
RUN mkdir /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]