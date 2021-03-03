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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0.145, green: 0.2, blue: 0.204, alpha: 1)
    createCollectionView()
    createDataSource()
    
    
    let view1 = UIView()
    view1.backgroundColor = UIColor(red: 0.145, green: 0.2, blue: 0.204, alpha: 1)
    view.addSubview(view1)
    view1.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      view1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      view1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      view1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      view1.heightAnchor.constraint(equalToConstant: 80),
    ])
  }
  
  //  override func viewDidLayoutSubviews() {
  //    super.viewDidLayoutSubviews()
  //    collectionView.frame
//  }
  
  private func createCollectionView() {
//    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionLayout())
    collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 80), collectionViewLayout: createCompositionLayout())
    collectionView.backgroundColor = .clear    
    
    collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
    let nib1 = UINib(nibName: "QuotesCollectionViewCell", bundle: nil)
    collectionView.register(nib1, forCellWithReuseIdentifier: QuotesCollectionViewCell.reuseIdentifier)
    let nib2 = UINib(nibName: "FeelingsCollectionViewCell", bundle: nil)
    collectionView.register(nib2, forCellWithReuseIdentifier: FeelingsCollectionViewCell.reuseIdentifier)
    view.addSubview(collectionView)
    collectionView.delegate = self
  }
  
}

// MARK: - Setup layout

extension MainViewController {
  private func createCompositionLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
      
      guard let section = Section(rawValue: sectionIndex) else {
        fatalError("Unknown section kind")
      }
      
      switch section {
      case .first:
        return self.createOneLayoutSection()
      case .second:
        return self.createTwoLayoutSection()
      }
      
    }
    
    let config = UICollectionViewCompositionalLayoutConfiguration()
    config.interSectionSpacing = 20
    layout.configuration = config
    return layout
  }
  
  private func createOneLayoutSection() -> NSCollectionLayoutSection {
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(90),
                                           heightDimension: .absolute(100))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    section.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)
    section.interGroupSpacing = 15
    
    let sectionHeader = createSectionHeader()
    section.boundarySupplementaryItems = [sectionHeader]
    return section
  }
  
  private func createTwoLayoutSection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                           heightDimension: .absolute(170))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
    section.interGroupSpacing = 25
    section.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 18, bottom: 20, trailing: 18)
    return section
  }
  
  private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
      let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                     heightDimension: .estimated(100))
      let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                      elementKind: UICollectionView.elementKindSectionHeader,
                                                                      alignment: .top)
      return sectionHeader
  }
}


// MARK: - Data Source

extension MainViewController {
  
  func createDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView) {
        (collectionView: UICollectionView, indexPath: IndexPath, item: AnyHashable) -> UICollectionViewCell? in
      
      guard let section = Section(rawValue: indexPath.section) else {
        fatalError("Unknown section kind")
      }
      
      switch section {
      case .first:
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: QuotesCollectionViewCell.reuseIdentifier,
                for: indexPath) as? QuotesCollectionViewCell else { fatalError("Cannot create new cell") }
        cell.configure(data: Quotes(id: 1, title: "\(indexPath.section)", position: 1, image: nil))
        return cell
      case .second:
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FeelingsCollectionViewCell.reuseIdentifier,
                for: indexPath) as? FeelingsCollectionViewCell else { fatalError("Cannot create new cell") }
        
        let img = indexPath.row % 2 == 0 ? UIImage(named: "feel1") : UIImage(named: "feel2")
        
        cell.configure(data: Feelings(id: 1, title: "\(indexPath.section)", image: img, description: "\(indexPath.section) \(indexPath.row) \(indexPath.item)"))
        return cell
      }
    }
    
    var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
    snapshot.appendSections([.first, .second])
    snapshot.appendItems(Array(0...10).map { Quotes(id: $0, title: "\($0)", position: 1, image: nil) }, toSection: .first)
    snapshot.appendItems(Array(5...20).map { Feelings(id: $0, title: "\($0)", image: nil, description: "") }, toSection: .second)
    
    
    dataSource?.supplementaryViewProvider = {  collectionView, kind, indexPath in
      guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else {
        return nil
      }
      
      sectionHeader.title.text = "С возвращением, Эмиль!"
      sectionHeader.subtitle.text = "Каким ты себя ощущаешь сегодня?"
      return sectionHeader
    }
    dataSource.apply(snapshot)
  }
  
  
  
}



class SectionHeader: UICollectionReusableView {
  static let reuseIdentifier = "SectionHeader"
  
  // horiaontal
  let buttonMenu = UIButton(type: .custom)
  let logo = UIImageView()
  let buttonAvatar = UIButton(frame: CGRect.init(x: 0, y: 0, width: 35, height: 35))
    // vertical
  let title = UILabel()
  let subtitle = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    

    // horizontalStackView
//    buttonMenu.setTitle("buttonMenu", for: .normal)
    buttonMenu.setImage(UIImage(named: "Hamburger"), for: .normal)
    logo.image = UIImage(named: "Logo-1")
    logo.contentMode = .scaleAspectFit
    logo.layer.masksToBounds = true
//    buttonAvatar.setTitle("buttonAvatar", for: .normal)
    buttonAvatar.setImage(UIImage(named: "Profile"), for: .normal)
    buttonAvatar.translatesAutoresizingMaskIntoConstraints = false
    
    let horizontalStackView = UIStackView(arrangedSubviews: [buttonMenu, logo, buttonAvatar])
    horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    horizontalStackView.axis = .horizontal
    horizontalStackView.alignment = .fill
    horizontalStackView.distribution = .equalSpacing
    addSubview(horizontalStackView)
    
    // verticalStackView
    title.textColor = .white
    title.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 27, weight: .bold))
    subtitle.textColor = .gray
    subtitle.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .medium))
    
    let verticalStackView = UIStackView(arrangedSubviews: [title, subtitle])
    verticalStackView.translatesAutoresizingMaskIntoConstraints = false
    verticalStackView.axis = .vertical
    addSubview(verticalStackView)
    
    NSLayoutConstraint.activate([
      buttonAvatar.heightAnchor.constraint(equalToConstant: 35),
      buttonAvatar.widthAnchor.constraint(equalToConstant: 35),
      horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
      horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
      horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
//      horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    NSLayoutConstraint.activate([
      verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
      verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
      verticalStackView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 20),
      verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    verticalStackView.setCustomSpacing(10, after: title)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Stop trying to make storyboards happen.")
  }
}
