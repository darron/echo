# Stage 1: Build the Golang binary
FROM golang:1.20-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go application source code into the container
COPY . .

# Build the Go application binary
RUN CGO_ENABLED=0 go build -o app .

# Stage 2: Create the final Docker image
FROM scratch

# Copy the binary from the builder stage to the current stage
COPY --from=builder /app/app /app

# Expose the port the application listens on
EXPOSE 8080

# Set the entry point for the container
ENTRYPOINT ["/app"]
