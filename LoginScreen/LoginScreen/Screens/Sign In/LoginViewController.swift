//
//  LoginViewController.swift
//  LoginScreen
//
//  Created by Gabriel do Prado Moreira on 23/02/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var formTitle: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.title
        return label
    }()
    
    lazy var formSubTitile: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.subTitle
        label.numberOfLines = 2
        return label
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [formTitle, formSubTitile])
        stack.axis = .vertical
        stack.spacing = Constants.Layout.stackSpacing
        stack.widthAnchor.constraint(equalToConstant: Constants.Sizing.stackWidht).isActive = true
        return stack
    }()
    
    lazy var emailView: UIView = {
        let view = InputViewSetup.shared.configureUIView(with: emailTextField)
        return view
    }()
    
    lazy var emailTextField: UITextField =  {
        let textField = InputViewSetup.shared.configureTextField(with: Constants.Texts.email)
        return textField
    }()
    
    lazy var passwordView: UIView = {
        let view = InputViewSetup.shared.configureUIView(with: passwordTextField)
        return view
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = InputViewSetup.shared.configureTextField(with: Constants.Texts.password)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
//        view.addSubview(stack)
        view.addSubview(emailView)
        
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emailView.translatesAutoresizingMaskIntoConstraints = false
        emailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
}
