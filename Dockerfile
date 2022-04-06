FROM golang:1.18
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -mod vendor -ldflags="-w -s" -v -o app .

CMD["app"]