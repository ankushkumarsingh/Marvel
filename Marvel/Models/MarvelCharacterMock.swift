//
//  MarvelCharacterMock.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation
enum MarvelCharacterMock {
  static let ironMan = MarvelCharacter(
    id: 0,
    name: "Iron Man",
    imageName: "IronMan",
    metaDescription: "Iron Man is a 2008 American superhero film based on the Marvel Comics character of the same name. Produced by Marvel Studios and distributed by Paramount Pictures,[N 1] it is the first film in the Marvel Cinematic Universe.")

  static let captainAmerica = MarvelCharacter(
    id: 0,
    name: "Captain America",
    imageName: "CaptainAmerica",
    metaDescription: "Captain America: The First Avenger is a 2011 American superhero film based on the Marvel Comics character Captain America.")

  static let marvelCharactersMock = [
    ironMan,
    captainAmerica
  ]
}
