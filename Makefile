all: client server

server: cmd/server/main.go
	go build -o server cmd/server/main.go

client: cmd/client/main.go
	go build -o client cmd/client/main.go

clean:
	rm -f client server
