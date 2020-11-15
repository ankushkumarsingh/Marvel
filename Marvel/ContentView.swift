//
//  MarvelApp.swift
//  Marvel
//
//  Created by Ankush Singh on 14/11/20.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var store: MarvelCharacterStore
  
  var body: some View {
    NavigationView {
      MarvelListView(characters: store.characters)
    }
  }
}
