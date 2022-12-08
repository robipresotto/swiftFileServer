//
//  FileServerController.swift
//  
//
//  Created by Robinson Presotto on 05/12/2022.
//

import Vapor

struct FileServerController {

  static func downloads(req: Request) async throws -> [String] {
    return try FileManager.default.contentsOfDirectory(
      atPath: req.application.uploadsDir()
    )
  }

  static func download(req: Request) async throws -> Response {
    guard let upload = req.parameters.get("file") else {
      throw Abort(.badRequest)
    }
            
    guard let _ = try await self.downloads(
      req: req
    ).first(where: { $0 == upload }) else {
      throw Abort(.notFound)
    }
    
    return req.fileio.streamFile(
      at: req.application.uploadsDir() + upload
    )
  }

  static func upload(req: Request) throws -> EventLoopFuture<HTTPStatus> {
    guard let fileName = req.parameters.get("file") else {
      throw Abort(.badRequest)
    }
    
    let filePath = req.application.uploadsDir() + fileName
    return req.application.fileio.openFile(
      path: filePath,
      mode: .write,
      flags: .allowFileCreation(),
      eventLoop: req.eventLoop
    ).flatMap { fileHandle in
      let promise = req.eventLoop.makePromise(of: HTTPStatus.self)
      req.body.drain { part in
        switch part {
          case .buffer(let buffer):
            return req.application.fileio.write(
              fileHandle: fileHandle,
              buffer: buffer,
              eventLoop: req.eventLoop
            )
          case .error(let error):
            return req.eventLoop.submit {
              promise.fail(error)
              try fileHandle.close()
            }
          case .end:
            return req.eventLoop.submit {
              promise.succeed(.ok)
              try fileHandle.close()
            }
        }
      }
      return promise.futureResult
    }
  }
}
