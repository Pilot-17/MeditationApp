//
//  SceneDelegate.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 22.02.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = OnboardingViewController()
    window.makeKeyAndVisible()
    self.window = window
  }
}

