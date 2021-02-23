//
//  MainViewController.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 23.02.2021.
//

import UIKit

class MainViewController: UIViewController {
  
  var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0.145, green: 0.2, blue: 0.204, alpha: 1)
    createCollectionView()
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .clear
    collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    let nib1 = UINib(nibName: CollectionViewCell.reuseIdentifier, bundle: nil)
    collectionView.register(nib1, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
    let nib2 = UINib(nibName: BigCollectionViewCell.reuseIdentifier, bundle: nil)
    collectionView.register(nib2, forCellWithReuseIdentifier: BigCollectionViewCell.reuseIdentifier)
    view.addSubview(collectionView)
  }
  
  
  private func createCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionLayout())
  }
  
  private func createCompositionLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
      
      if sectionIndex == 0 {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(90),
                                               heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
        let sectin = NSCollectionLayoutSection(group: group)
        sectin.orthogonalScrollingBehavior = .continuous
        sectin.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)
        sectin.interGroupSpacing = 15
        return sectin
      } else {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(170))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let sectin = NSCollectionLayoutSection(group: group)
        sectin.interGroupSpacing = 25
        sectin.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 18, bottom: 20, trailing: 18)
        return sectin
      }
    }
    return layout
  }
  
  
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath)
    
    let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: BigCollectionViewCell.reuseIdentifier, for: indexPath)
//    cell1.backgroundColor = .red
//    cell2.backgroundColor = .orange
    
    if indexPath.section == 0 {
      return cell1
    } else {
      return cell2
    }
    
    
  }
  
  
  
}

