# grpc-keepalive-test

## Server

```
docker-compose up
```

### Observed Logs

```
traefik    | 2022/07/05 02:50:03 server.go:647: http2: server read frame WINDOW_UPDATE len=4 (conn) incr=21
traefik    | 2022/07/05 02:50:03 frame.go:520: http2: Framer 0xc0002828c0: read PING len=8 ping="\x02\x04\x10\x10\t\x0e\a\a"
traefik    | 2022/07/05 02:50:03 server.go:647: http2: server read frame PING len=8 ping="\x02\x04\x10\x10\t\x0e\a\a"
traefik    | 2022/07/05 02:50:03 frame.go:393: http2: Framer 0xc0002828c0: wrote PING flags=ACK len=8 ping="\x02\x04\x10\x10\t\x0e\a\a"
traefik    | 2022/07/05 02:50:13 frame.go:520: http2: Framer 0xc0002828c0: read PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:13 server.go:647: http2: server read frame PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:13 frame.go:393: http2: Framer 0xc0002828c0: wrote PING flags=ACK len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
grpc-server | 2022/07/05 02:50:18 http2: Framer 0xc0001b8000: wrote PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
grpc-server | 2022/07/05 02:50:18 http2: Framer 0xc0001b8000: read PING flags=ACK len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:18 frame.go:520: http2: Framer 0xc0000ba2a0: read PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:18 transport.go:2903: http2: Transport received PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:18 frame.go:393: http2: Framer 0xc0000ba2a0: wrote PING flags=ACK len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:23 frame.go:520: http2: Framer 0xc0002828c0: read PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:23 server.go:647: http2: server read frame PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:23 frame.go:393: http2: Framer 0xc0002828c0: wrote PING flags=ACK len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
grpc-server | 2022/07/05 02:50:33 http2: Framer 0xc0001b8000: wrote PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
grpc-server | 2022/07/05 02:50:33 http2: Framer 0xc0001b8000: read PING flags=ACK len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:33 frame.go:520: http2: Framer 0xc0000ba2a0: read PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:33 transport.go:2903: http2: Transport received PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:33 frame.go:393: http2: Framer 0xc0000ba2a0: wrote PING flags=ACK len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:33 frame.go:520: http2: Framer 0xc0002828c0: read PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:33 server.go:647: http2: server read frame PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
traefik    | 2022/07/05 02:50:33 frame.go:393: http2: Framer 0xc0002828c0: wrote PING flags=ACK len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
```

## Client

```
make client
GODEBUG=http2debug=2 GRPC_TRACE=all GRPC_VERBOSITY=DEBUG ./client -addr localhost:80
```

### Observed Logs

```
2022/07/05 02:50:03 http2: Framer 0xc0001fa000: wrote WINDOW_UPDATE len=4 (conn) incr=21
2022/07/05 02:50:03 http2: Framer 0xc0001fa000: wrote PING len=8 ping="\x02\x04\x10\x10\t\x0e\a\a"
RPC response: message:"keepalive demo"
2022/07/05 02:50:03 http2: Framer 0xc0001fa000: read PING flags=ACK len=8 ping="\x02\x04\x10\x10\t\x0e\a\a"
2022/07/05 02:50:13 http2: Framer 0xc0001fa000: wrote PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
2022/07/05 02:50:13 http2: Framer 0xc0001fa000: read PING flags=ACK len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
2022/07/05 02:50:23 http2: Framer 0xc0001fa000: wrote PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
2022/07/05 02:50:23 http2: Framer 0xc0001fa000: read PING flags=ACK len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
2022/07/05 02:50:33 http2: Framer 0xc0001fa000: wrote PING len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
2022/07/05 02:50:33 http2: Framer 0xc0001fa000: read PING flags=ACK len=8 ping="\x00\x00\x00\x00\x00\x00\x00\x00"
```
