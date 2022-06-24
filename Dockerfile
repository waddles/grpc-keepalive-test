FROM alpine:latest

WORKDIR /usr/local/bin
COPY ./client ./grpc-keepalive-client
COPY ./server ./grpc-keepalive-server

CMD [ "grpc-keepalive-server" ]
