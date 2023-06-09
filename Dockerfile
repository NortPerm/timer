FROM --platform=linux/amd64 golang:1.19-alpine as build
RUN apk update && apk add --no-cache git ca-certificates && update-ca-certificates

ENV CGO_ENABLED 0
ENV GOARCH amd64
ENV GOOS linux

WORKDIR /app
COPY go.mod .
RUN go mod download
COPY . .
RUN mkdir -p build
RUN go build -trimpath -ldflags="-w -s" -o build/timer .

FROM scratch
WORKDIR /app
COPY --from=build /app/build/timer .
CMD ["/app/timer"]
