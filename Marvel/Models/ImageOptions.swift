//
//  ImageOptions.swift
//  Marvel
//
//  Created by Ankush Singh on 16/11/20.
//

import SwiftUI

enum ImageOptions: String, CaseIterable {
  case ironMan = "IronMan"
  case captainAmerica = "CaptainAmerica"

  var imageName: String {
    rawValue
  }

  var name: String {
    switch self {
      case .ironMan:
        return "Iron Man"
      case .captainAmerica:
        return "Captain America"
    }
  }
}
