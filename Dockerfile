FROM golang:1.16 as builder

WORKDIR /usr/src/goatcounter

COPY vendor/go.mod vendor/go.sum ./
RUN go mod download
COPY vendor/ ./
RUN go build -v -o /usr/local/bin/goatcounter ./cmd/goatcounter

FROM debian:buster-slim
COPY --from=builder /usr/local/bin/goatcounter /usr/local/bin/goatcounter
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
EXPOSE 8081
CMD ["entrypoint.sh"]
