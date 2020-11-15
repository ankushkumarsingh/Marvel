//
//  RealmMigrator.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation
import RealmSwift

enum RealmMigrator {
  static private func migrationBlock(
    migration: Migration,
    oldSchemaVersion: UInt64
  ) {
    if oldSchemaVersion < 1 {
      migration.enumerateObjects(ofType: MarvelCharacterDB.className()) { _, newObject in
        newObject?["name"] = "IronMan"
      }
    }
  }

  static func setDefaultConfiguration() {
    let config = Realm.Configuration(
      schemaVersion: 1,
      migrationBlock: migrationBlock)
    Realm.Configuration.defaultConfiguration = config
  }
}
