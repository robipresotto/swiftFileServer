# swiftFileServer
A tiny file server written in `swift` and built using docker.

#### Requirements
- swift 5+

#### Env vars
- VOLUME_PATH

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
