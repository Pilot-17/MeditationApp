//
//  LoginViewController.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 22.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
  
  lazy var emailTextField: UITextField = {
    let txtFld = UITextField()
    txtFld.translatesAutoresizingMaskIntoConstraints = false
    txtFld.backgroundColor = .clear
    txtFld.tintColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    txtFld.textColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    txtFld.attributedPlaceholder = NSAttributedString(string: "Email",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    return txtFld
  }()
  
  lazy var passwordTextField: UITextField = {
    let txtFld = UITextField()
    txtFld.translatesAutoresizingMaskIntoConstraints = false
    txtFld.backgroundColor = .clear
    txtFld.tintColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    txtFld.textColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    txtFld.attributedPlaceholder = NSAttributedString(string: "Пароль",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    return txtFld
  }()
  
  lazy var emailUIView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    return view
  }()
  
  lazy var passwordUIView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    return view
  }()
  
  lazy var buttonLogin: UIButton = {
    let btn = UIButton(type: .system)
    btn.tintColor = .white
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.backgroundColor = UIColor(red: 0.486, green: 0.604, blue: 0.573, alpha: 1)
    btn.setTitle("ВОЙТИ", for: .normal)
    btn.titleLabel?.font = UIFont(name: "Alegreya-Medium", size: 25)
    btn.layer.cornerRadius = 10
    return btn
  }()
  
  lazy var signUpLabel: UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.textColor = .white
    lbl.text = "Еще нет аккаунта?"
    lbl.font = UIFont(name: "Alegreya-Medium", size: 20)
    return lbl
  }()
  
  lazy var signUpButton: UIButton = {
    let btn = UIButton(type: .system)
    btn.tintColor = .white
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.setTitle("Зарегистрируйтесь", for: .normal)
    btn.titleLabel?.font = UIFont(name: "Alegreya-Bold", size: 20)
    btn.isUserInteractionEnabled = true
    return btn
  }()
  
  lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis  = .horizontal
    stackView.distribution  = .fillEqually
    stackView.alignment = .fill
    stackView.spacing = 1.0
    stackView.addArrangedSubview(signUpLabel)
    stackView.addArrangedSubview(signUpButton)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0.145, green: 0.2, blue: 0.204, alpha: 1)
    
    view.addSubview(emailUIView)
    view.addSubview(passwordUIView)
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(buttonLogin)
    view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -211),
      stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    
    NSLayoutConstraint.activate([
      buttonLogin.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -23),
      buttonLogin.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -27),
      buttonLogin.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 27),
      buttonLogin.heightAnchor.constraint(equalToConstant: 61)
        ])
    
    NSLayoutConstraint.activate([
      emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
      emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
      emailTextField.heightAnchor.constraint(equalToConstant: 40),
      emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -40)
        ])
    
    NSLayoutConstraint.activate([
      emailUIView.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 0),
      emailUIView.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: 0),
      emailUIView.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 0),
      emailUIView.heightAnchor.constraint(equalToConstant: 2)
        ])
    
    NSLayoutConstraint.activate([
      passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
      passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
      passwordTextField.heightAnchor.constraint(equalToConstant: 40),
      passwordTextField.bottomAnchor.constraint(equalTo: buttonLogin.topAnchor, constant: -55)
        ])
    NSLayoutConstraint.activate([
      passwordUIView.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 0),
      passwordUIView.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: 0),
      passwordUIView.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor, constant: 0),
      passwordUIView.heightAnchor.constraint(equalToConstant: 2)
        ])

    
    
  }
}
