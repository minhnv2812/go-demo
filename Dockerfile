FROM golang:1.18
WORKDIR /go
COPY . .
RUN CGO_ENABLED=0 go build -mod vendor -ldflags="-w -s" -v -o /app/main .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=go_builder /app/main ./
RUN chmod +x ./main
EXPOSE 8080
CMD ./main