//
//  MarvelCharacter.swift
//  Marvel
//
//  Created by Ankush Singh on 14/11/20.
//

import Foundation

struct MarvelCharacter: Hashable, Identifiable {
  let id: Int
  let name: String
  let imageName: String
  let metaDescription: String
}

// MARK: Convenience init
extension MarvelCharacter {
  init(marvelCharacterDB: MarvelCharacterDB) {
    id = marvelCharacterDB.id
    name = marvelCharacterDB.name
    imageName = marvelCharacterDB.imageName
    metaDescription = marvelCharacterDB.metaDescription
  }
}
