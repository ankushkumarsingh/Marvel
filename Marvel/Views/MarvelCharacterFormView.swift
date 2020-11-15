//
//  MarvelCharacterFormView.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//

import SwiftUI

struct MarvelCharacterFormView: View {
  @EnvironmentObject var store: MarvelCharacterStore
  @Environment(\.presentationMode) var presentationMode
  @ObservedObject var form: MarvelCharacterForm
  let imageOptions = ImageOptions.allCases

  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $form.name)
        Picker(selection: $form.imageName, label: Text("Pick Image")) {
          ForEach(imageOptions, id: \.self) { option in
            Text(option.imageName)
          }
        }
        Section(header: Text("Description 📝")) {
          TextField("", text: $form.metaDescription)
        }
      }
      .navigationBarTitle("Add Super Hero", displayMode: .inline)
      .navigationBarItems(
        trailing: Button(
          form.isUpdating ? "Update": "Save",
          action: form.isUpdating ? updateMarvelCharacter: saveMarvelCharacter))
    }
  }
}

// MARK: - Actions
extension MarvelCharacterFormView {
  func dismiss() {
    presentationMode.wrappedValue.dismiss()
  }

  func saveMarvelCharacter() {
    store.create(
      name: form.name,
      imageName: form.imageName,
      metaDescription: form.metaDescription)
    dismiss()
  }

  func updateMarvelCharacter() {
    if let marvelCharacterID = form.marvelCharacterID {
      store.update(
        marvelCharacterID: marvelCharacterID,
        name: form.name,
        imageName: form.imageName,
        metaDescription: form.metaDescription)
      dismiss()
    }
  }
}

#if DEBUG
struct IngredientFormView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      MarvelCharacterFormView(form: MarvelCharacterForm())
      MarvelCharacterFormView(form: MarvelCharacterForm(MarvelCharacterMock.marvelCharactersMock[0]))
    }
  }
}
#endif
