import Vapor

extension Application {
  
  func uploadsDir() -> String {
    let rootPath = Constants.volumePath ?? self.directory.workingDirectory
    return "\(rootPath)/uploads/"
  }
  
  func setupServingDir() throws {
    
    try FileManager.default.createDirectory(
      atPath: self.uploadsDir(),
      withIntermediateDirectories: true,
      attributes: nil
    )
    
  }
  
}
