FROM golang:1.11.4-alpine3.8 as builder
COPY main.go .
RUN go build -o /code main.go

FROM alpine:latest
WORKDIR /root
COPY --from=builder /code .
ENTRYPOINT ["./code"]
