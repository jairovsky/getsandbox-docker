FROM openjdk:8

COPY ./runtime-binary.tar .

ARG VERSION="1.0.238"

ARG DOWNLOAD="https://bintray.com/getsandbox/public/download_file?file_path=com%2Fsandbox%2Fsandbox%2F$VERSION%2Fsandbox-$VERSION-all.jar"

RUN wget $DOWNLOAD -O /sandbox

RUN useradd dev
RUN mkdir /base && chown dev:dev /base
USER dev

EXPOSE 8080

CMD ["sh", "-c", "java -jar /sandbox run --port=8080 --base=/base" ]
