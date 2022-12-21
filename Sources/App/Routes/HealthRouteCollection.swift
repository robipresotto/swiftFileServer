import Vapor

struct HealthRouteCollection: RouteCollection {
  
  func boot(routes: Vapor.RoutesBuilder) throws {
    routes.get("health", use: HealthController.check)
  }
  
}
