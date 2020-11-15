//
//  MarvelCharacterDB.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation
import RealmSwift

@objcMembers
class MarvelCharacterDB: Object {

  dynamic var id = 0
  dynamic var name = ""
  dynamic var imageName = ""
  dynamic var metaDescription = ""

  override static func primaryKey() -> String? {
    return "id"
  }

  override static func indexedProperties() -> [String] {
    return ["name"]
  }

}
