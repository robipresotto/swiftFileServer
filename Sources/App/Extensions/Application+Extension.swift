//
//  File.swift
//  
//
//  Created by Robinson Presotto on 05/12/2022.
//

import Vapor

extension Application {
  
  func uploadsDir() -> String {
    return "\(self.directory.workingDirectory)/uploads/"
  }
  
  func setupServingDir() throws {
    
    try FileManager.default.createDirectory(
      atPath: self.uploadsDir(),
      withIntermediateDirectories: true,
      attributes: nil
    )
    
  }
  
}
