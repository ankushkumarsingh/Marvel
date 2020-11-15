//
//  SceneDelegate.swift
//  Marvel
//
//  Created by Ankush Singh on 15/11/20.
//


import UIKit
import SwiftUI
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    RealmMigrator.setDefaultConfiguration()
    if let windowScene = scene as? UIWindowScene {
      do {
        // 1
        let realm = try Realm()
        let window = UIWindow(windowScene: windowScene)
        // 2
        let contentView = ContentView()
          .environmentObject(MarvelCharacterStore(realm: realm))
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
      } catch let error {
        // Handle error
        fatalError("Failed to open Realm. Error: \(error.localizedDescription)")
      }
    }
  }
}
