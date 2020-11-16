//
//  MarvelCharacterForm.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation
class MarvelCharacterForm: ObservableObject {
  @Published var name = ""
  @Published var image = ImageOptions.ironMan
  @Published var metaDescription = ""

  var marvelCharacterID: Int?

  var isUpdating: Bool {
    marvelCharacterID != nil
  }

  init() { }

  init(_ marvelCharacter: MarvelCharacter) {
    name = marvelCharacter.name
    image = ImageOptions(rawValue: marvelCharacter.imageName) ?? .ironMan
    metaDescription = marvelCharacter.metaDescription
    marvelCharacterID = marvelCharacter.id
  }
}
