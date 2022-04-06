FROM golang:1.18
WORKDIR /go
COPY . .
RUN CGO_ENABLED=0 go build -mod vendor -ldflags="-w -s" -v -o /app/main .
RUN chmod +x ./main
CMD["./main"]