//
//  PathExplorer.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation

fileprivate let database = "Databases"

class PathExplorer {
  class var libraryDirPath: String {
    let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    if let libraryPath = path.first {
      return libraryPath
    }
    return ""
  }

  class var documentDirPath: String {
    let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    if let documentPath = path.first {
      return documentPath
    }
    return ""
  }

  class var bundleDBPath: String {
    return Bundle.main.resourcePath?.stringByAppendingPathComponent(path: database) ?? ""
  }

  class var documentDBPath: String {
    return documentDirPath.stringByAppendingPathComponent(path: database)
  }

}
