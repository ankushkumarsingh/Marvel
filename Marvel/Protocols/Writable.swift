//
//  Writable.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation
import RealmSwift

protocol Writable {
  func operateOn<C: RealmCollection>(collection: C)
}

extension Writable {
  func operateOn<C: RealmCollection>(collection: C) {
    // Collection could be either Results or List
    print("operating on collection containing \(collection.count) objects")
  }
}
