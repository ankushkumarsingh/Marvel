//
//  MarvelApp.swift
//  Marvel
//
//  Created by Ankush Singh on 14/11/20.
//

import SwiftUI

@main
struct MarvelApp: App {
  @EnvironmentObject var store: MarvelCharacterStore
  
  //  var body: some View {
  //    NavigationView {
  //      MarvelListView(characters: store.characters)
  //    }
  //  }
  var body: some Scene {
    WindowGroup {
      MarvelListView(characters: store.characters)
    }
  }
}
