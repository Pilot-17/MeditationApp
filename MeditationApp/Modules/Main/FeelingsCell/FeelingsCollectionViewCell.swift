//
//  FeelingsCollectionViewCell.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 23.02.2021.
//

import UIKit

class FeelingsCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var image: UIImageView!
  
  
  static let reuseIdentifier = "FeelingsCollectionViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    view.layer.cornerRadius = 20
    button.layer.cornerRadius = 10
  }
  
  func configure(data: Feelings) {
    nameLabel.text = data.title
    descriptionLabel.text = data.description
    if let image = data.image {
      self.image.image = image
    }
  }
  
}
