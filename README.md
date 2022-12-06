# swiftFileServer
A tiny file server written in `swift` and build using docker.

#### Requirements
- swift 5+

#### Getting started
```sh
./deploy.sh
```

#### Endpoints

|METHOD|PATH|RESPONSE|
|---|---|---|
|GET|/downloads|[String]|
|GET|/download/file.x|[HTTPStatus]|
|POST|/upload/file.x|[HTTPStatus]|
