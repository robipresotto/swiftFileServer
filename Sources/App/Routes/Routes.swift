import Vapor

func routes(_ app: Application) throws {
  
  // Register route collections
  try app.register(collection: HealthRouteCollection())
  try app.register(collection: FileServerRouteCollection())
  
}
