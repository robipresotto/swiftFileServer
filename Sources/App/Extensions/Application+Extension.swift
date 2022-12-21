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
