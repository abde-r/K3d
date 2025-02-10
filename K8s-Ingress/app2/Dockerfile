# Build stage
FROM golang:1.23.6-alpine AS builder
WORKDIR /app

RUN if [ ! -f go.mod ]; then \
      go mod init auto/module; \
    fi
RUN go mod tidy
COPY . .
RUN go build -o server .

# Final image stage
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8080
CMD ["./server"]
