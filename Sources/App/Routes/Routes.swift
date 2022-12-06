import Vapor

func routes(_ app: Application) throws {

  // Register the FileServer RouteCollection
  try app.register(collection: FileServerRouteCollection())
  
}
