//
//  MarvelCharacterRow.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import SwiftUI

struct MarvelCharacterRow: View {
  @EnvironmentObject var store: MarvelCharacterStore
  @State private var marvelCharFormIsPresented = false
  let character: MarvelCharacter

    var body: some View {
      VStack(alignment: .leading) {
        Text(character.name)
          .font(.title)
          .padding()
        HStack {
          Image(character.imageName).padding()
          Text(character.metaDescription)
            .font(.subheadline)
            .padding()
          Spacer()
          Circle()
            .fill(Color(.purple))
            .frame(width: 12, height: 12)
          Button(action: deleteCharacter) {
            Image(systemName: "trash.circle.fill")
              .resizable()
              .frame(width: 24, height: 24)
              .foregroundColor(.red)
          }
        }
      }
    }
}

// MARK: - Actions
extension MarvelCharacterRow {

  func deleteCharacter() {
    withAnimation {
      store.delete(marvelCharacterID: character.id)
    }
  }
}

#if DEBUG
struct IngredientRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      MarvelCharacterRow(character: MarvelCharacterMock.marvelCharactersMock[0])
    }
    .previewLayout(.sizeThatFits)
  }
}
#endif
