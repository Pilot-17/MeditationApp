//
//  OnboardingViewController.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 22.02.2021.
//

import UIKit

class OnboardingViewController: UIViewController {

  let mainView = OnboardingView()
  
  override func loadView() {
    view = mainView
    mainView.delegate = self
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}

extension OnboardingViewController: OnboardingViewControllerProtocol {
  func loginButtonAction() {
    let vc = MainViewController()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true, completion: nil)
  }
}

