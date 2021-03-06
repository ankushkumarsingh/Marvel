//
//  ContentView.swift
//  Marvel
//
//  Created by Ankush Singh on 14/11/20.
//

import SwiftUI
import RealmSwift

struct MarvelListView: View {

  @EnvironmentObject var store: MarvelCharacterStore
  @State private var marvelCharFormIsPresented = false
  let characters: [MarvelCharacter]

  var body: some View {
    List {
      Section(header: Text("Characters")) {
        if characters.isEmpty {
          Text("Add some super heros to the list")
            .foregroundColor(.gray)
        }
        ForEach(characters, id: \.self) { character in
          MarvelCharacterRow(character: character)
        }
        addCharacterButton
      }
    }
    .listStyle(GroupedListStyle())
    .navigationBarTitle("Marvel Universe")
  }

  var addCharacterButton: some View {
    Button(action: openNewCharacterForm) {
      HStack {
        Image(systemName: "plus.circle.fill")
        Text("Add Character")
          .bold()
      }
    }
    .foregroundColor(.green)
    .sheet(isPresented: $marvelCharFormIsPresented) {
      MarvelCharacterFormView(form: MarvelCharacterForm())
        .environmentObject(self.store)
    }
  }

}


// MARK: - Actions
extension MarvelListView {
  func openNewCharacterForm() {
    marvelCharFormIsPresented.toggle()
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      MarvelListView(characters: MarvelCharacterMock.marvelCharactersMock)
    }
}
#endif
