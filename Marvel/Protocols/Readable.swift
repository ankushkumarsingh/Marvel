//
//  Readable.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation
import RealmSwift

protocol Readable {
  func findAll() -> AnyRealmCollection<Object>
}
