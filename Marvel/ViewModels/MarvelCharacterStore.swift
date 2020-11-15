//
//  MarvelCharacterStore.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import Foundation
import RealmSwift

final class MarvelCharacterStore: ObservableObject {
  private var marvelCharacterResults: Results<MarvelCharacterDB>
  init(realm: Realm) {
    marvelCharacterResults = realm.objects(MarvelCharacterDB.self)
  }

  var characters: [MarvelCharacter] {
    marvelCharacterResults.map(MarvelCharacter.init)
  }

}

// MARK: - CRUD Actions
extension MarvelCharacterStore {
  func create(name: String, imageName: String, metaDescription: String) {
    objectWillChange.send()

    do {
      let realm = try Realm()

      let marvelCharacterDB = MarvelCharacterDB()
      marvelCharacterDB.id = UUID().hashValue
      marvelCharacterDB.name = name
      marvelCharacterDB.imageName = imageName
      marvelCharacterDB.metaDescription = metaDescription

      try realm.write {
        realm.add(marvelCharacterDB)
      }
    } catch let error {
      // Handle error
      print(error.localizedDescription)
    }
  }

  func toggleBought(character: MarvelCharacter) {
    objectWillChange.send()
    do {
      let realm = try Realm()
      try realm.write {
        realm.create(
          MarvelCharacterDB.self,
          value: ["id": character.id],
          update: .modified)
      }
    } catch let error {
      // Handle error
      print(error.localizedDescription)
    }
  }

  func update(
    marvelCharacterID: Int,
    name: String,
    imageName: String,
    metaDescription: String
  ) {
    objectWillChange.send()
    do {
      let realm = try Realm()
      try realm.write {
        realm.create(
          MarvelCharacterDB.self,
          value: [
            "id": marvelCharacterID,
            "name": name,
            "imageName": imageName,
            "metaDescription": metaDescription
          ],
          update: .modified)
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }

  func delete(marvelCharacterID: Int) {
    objectWillChange.send()
    guard let marvelCharacterID = marvelCharacterResults.first(
            where: { $0.id == marvelCharacterID })
    else { return }

    do {
      let realm = try Realm()
      try realm.write {
        realm.delete(marvelCharacterID)
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }
}
