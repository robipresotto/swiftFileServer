import Vapor

public func configure(_ app: Application) throws {
  
  // confing serving dir
  try app.setupServingDir()
  
  // register routes
  try routes(app)
  
}
