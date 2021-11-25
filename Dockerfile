FROM golang:alpine AS build
WORKDIR /build
COPY . .
RUN go mod download
RUN go build -o bin/app cmd/app/main.go

FROM alpine:latest
COPY --from=build /build/bin/app /bin/app
EXPOSE 80
ENTRYPOINT ["/bin/app"]
