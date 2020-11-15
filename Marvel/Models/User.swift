//
//  User.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation
import RealmSwift

@objcMembers
class User: Object {
  dynamic var _id = ObjectId.generate()
  dynamic var name = ""
}
