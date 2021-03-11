//
//  LoginViewController.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 22.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
  
  
  let mainView = LiginView()
  
  override func loadView() {
    view = mainView
    mainView.delegate = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
}

extension LoginViewController: LoginViewControllerProtocol {
  func loginButtonAction() {
    let vc = MainViewController()
    vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

    let vc2 = ProfileViewController()
    vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)

    let tabBarVc = UITabBarController()
    tabBarVc.modalPresentationStyle = .fullScreen
    tabBarVc.viewControllers = [vc, vc2]
    present(tabBarVc, animated: true, completion: nil)
  }
}





