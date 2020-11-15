//
//  DatabaseConnector.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation
import RealmSwift

fileprivate let databaseName = "MarvelDataBase"
fileprivate let markInstallPath = "startedFromFreshMarvelSchema"

class DatabaseConnector {
  private var bundleDBPath: String {
    return String(format: "%@/%@", PathExplorer.bundleDBPath,databaseName)
  }

  private var copiedDBPath: String {
    return String(format: "%@/%@", PathExplorer.documentDBPath,databaseName)
  }

  private func copySeedDataBase(){
    let fileManager = FileManager.default
    let realmDBBundlePath = bundleDBPath
    let databaseDocumentsPath = copiedDBPath
    do {
      if fileManager.fileExists(atPath: databaseDocumentsPath) {
        try fileManager.removeItem(atPath: databaseDocumentsPath)
      }
      try fileManager.copyItem(atPath: realmDBBundlePath, toPath: databaseDocumentsPath)

      let markFreshInstallPath = PathExplorer.documentDBPath.stringByAppendingPathComponent(path: markInstallPath)
      fileManager.createFile(atPath: markFreshInstallPath, contents: nil, attributes: nil)
    } catch let error {
      print(error)
    }
  }

  private func config(){
    
  }

}
