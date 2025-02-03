# Stage 1: Build
FROM golang:1.20 AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go get -u github.com/gorilla/mux
RUN go get go.mongodb.org/mongo-driver
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o go-to-do-app

# Stage 2: Production
FROM alpine:3.18
WORKDIR /app
COPY --from=builder /app/go-to-do-app .
COPY ./.env .
CMD ["./go-to-do-app"]
