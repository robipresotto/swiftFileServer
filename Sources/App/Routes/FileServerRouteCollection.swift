import Vapor

struct FileServerRouteCollection: RouteCollection {
  
  func boot(routes: Vapor.RoutesBuilder) throws {
    routes.get("downloads", use: FileServerController.downloads)
    routes.get(["download", ":file"], use: FileServerController.download)
    routes.on(.POST, ["upload", ":file"], body: .stream, use: FileServerController.upload)
  }
  
}
