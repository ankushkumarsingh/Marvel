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
  case spiderMan = "SpiderMan"
  case hulk = "Hulk"
  case vision = "Vision"
  case natasha = "Natasha"
  case antMan = "AntMan"
  case thor = "Thor"

  var imageName: String {
    rawValue
  }

  var name: String {
    switch self {
      case .ironMan:
        return "Iron Man"
      case .captainAmerica:
        return "Captain America"
      case .spiderMan:
        return "Spider Man"
      case .hulk:
        return "Hulk"
      case .vision:
        return "Vision"
      case .natasha:
        return "Natasha"
      case .antMan:
        return "Ant Man"
      case .thor:
        return "Thor"
    }
  }
}
