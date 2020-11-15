//
//  MarvelCharacterForm.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation
class MarvelCharacterForm: ObservableObject {
  @Published var name = ""
  @Published var imageName = ""
  @Published var metaDescription = ""

  var marvelCharacterID: Int?

  var updating: Bool {
    marvelCharacterID != nil
  }

  init() { }

  init(_ marvelCharacter: MarvelCharacter) {
    name = marvelCharacter.name
    imageName = marvelCharacter.imageName
    metaDescription = marvelCharacter.metaDescription
    marvelCharacterID = marvelCharacter.id
  }
}
