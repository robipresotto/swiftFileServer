import Vapor

struct HealthController {
  
  static func check(req: Request) throws -> Response {
    return Response(status: .ok)
  }

}
