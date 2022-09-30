FROM golang:alpine3.16 AS builder

WORKDIR /app

COPY . . 
RUN go build -o /main main.go

## Deploy
## Strach base debian
FROM scratch

WORKDIR /

COPY --from=builder /main /main

ENTRYPOINT ["/main"]