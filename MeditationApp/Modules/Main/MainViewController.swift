//
//  MainViewController.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 23.02.2021.
//

import UIKit

enum Section: Int, CaseIterable {
  case first
  case second
}

class MainViewController: UIViewController, UICollectionViewDelegate {
  
  var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>!
  var collectionView: UICollectionView!
  
  let mainView = MainView()
  
  override func loadView() {
    view = mainView
//    mainView.delegate = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}
