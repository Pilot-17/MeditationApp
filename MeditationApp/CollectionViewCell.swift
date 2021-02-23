//
//  CollectionViewCell.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 23.02.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  
  static let reuseIdentifier = "CollectionViewCell"

  @IBOutlet weak var view: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    view.layer.cornerRadius = 20
  }
  
}
