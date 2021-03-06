//
//  FormViewController.swift
//  LoginScreen
//
//  Created by Luiz Araujo 2022 on 23/02/22.
//

import UIKit

class FormViewController: UIViewController, WatchTimeSubscriber {
    //MARK: - Properties
    
    weak var loginViewDelegate: FormViewDelegate?
        
    let currentPartOfTheDay: PartOfTheDay
    
    lazy var formTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = Constants.Texts.title
        return label
    }()
    
    lazy var formSubTitile: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.subTitle
        label.numberOfLines = 2
        return label
    }()
    
    lazy var stackLabel: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [formTitle, formSubTitile])
        stack.axis = .vertical
        stack.spacing = Constants.Layout.stackSpacing
        stack.widthAnchor.constraint(equalToConstant: Constants.Sizing.stackLabelWidht).isActive = true
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
    
    lazy var stackTextFields: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailView, passwordView])
        stack.axis = .vertical
        stack.spacing = Constants.Layout.stackSpacing
        stack.widthAnchor.constraint(equalToConstant: Constants.Sizing.stackTextFieldWidht).isActive = true
        return stack
    }()
    
    lazy var loginButton: UIButton = {
        let button = CustomButtonSetup(frame: CGRect(x: 0, y: 0, width: 0, height: 0), color: UIColor(named: "mountain_A_\(self.currentPartOfTheDay.rawValue)")!)
        button.heightAnchor.constraint(equalToConstant: Constants.Sizing.loginButtonHeight).isActive = true
        button.widthAnchor.constraint(equalToConstant: Constants.Sizing.loginButtonWidth).isActive = true
        button.setTitle(Constants.Texts.loginButton, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
    
    private let registerAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: Constants.Texts.registerButton, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycle
    init(currentPartOfTheDay: PartOfTheDay) {
        self.currentPartOfTheDay = currentPartOfTheDay
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLayoutSubviews() {
        view.addSubview(stackLabel)
        view.addSubview(stackLabel)
        view.addSubview(stackTextFields)
        view.addSubview(loginButton)
        view.addSubview(registerAccountButton)
        
        stackLabel.translatesAutoresizingMaskIntoConstraints = false
        stackTextFields.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registerAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stackLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: sizeProportional(370)),
                                     stackLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                                     stackTextFields.topAnchor.constraint(equalTo: stackLabel.bottomAnchor, constant: 20),
                                     stackTextFields.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                                     loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                                     loginButton.topAnchor.constraint(equalTo: stackTextFields.bottomAnchor, constant: 20),
                                     registerAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                                     registerAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    
    //MARK: - OBSERVER
    func makeChanges(partOfTheDay: PartOfTheDay) {
        self.loginButton.removeFromSuperview()
        
        loginButton = CustomButtonSetup(frame: CGRect(x: 0, y: 0, width: 0, height: 0), color: UIColor(named: "mountain_A_\(partOfTheDay.rawValue)")!)
        loginButton.heightAnchor.constraint(equalToConstant: Constants.Sizing.loginButtonHeight).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: Constants.Sizing.loginButtonWidth).isActive = true
        loginButton.setTitle(Constants.Texts.loginButton, for: .normal)
        loginButton.tintColor = .white
        loginButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        
        self.view.addSubview(loginButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FormViewController {
    //MARK: - Helpers
    @objc
    func handleSignIn() {
        self.loginViewDelegate?.formViewInputs(email: self.emailTextField.text, password: self.passwordTextField.text)
    }
    
    @objc
    func handleSignUp() {
        self.loginViewDelegate?.changeScreenSignUp()
    }

}
