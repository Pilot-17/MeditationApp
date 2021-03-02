//
//  QuotesCollectionViewCell.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 23.02.2021.
//

import UIKit

class QuotesCollectionViewCell: UICollectionViewCell {
  
  static let reuseIdentifier = "QuotesCollectionViewCell"
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    imageView.layer.cornerRadius = 20
  }
  
  func configure(data: Quotes) {
    nameLabel.text = data.title
  }
}
