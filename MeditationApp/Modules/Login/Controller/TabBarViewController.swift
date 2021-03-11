//
//  TabBarViewController.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 06.03.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

      let firstViewController = MainViewController()
              
      firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
//
      let secondViewController = ProfileViewController()

      secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)

      let tabBarList = [firstViewController, secondViewController]

      viewControllers = tabBarList
    }
}
