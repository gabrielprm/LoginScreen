//
//  InputViewSetup.swift
//  LoginScreen
//
//  Created by Gabriel do Prado Moreira on 23/02/22.
//

import Foundation
import UIKit

struct InputViewSetup {
    
    static let shared = InputViewSetup()
    
    private init() { }
    
    func configureUIView(with textField: UITextField) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        view.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([view.widthAnchor.constraint(equalToConstant: Constants.Sizing.textFieldViewWidth),
                                     view.heightAnchor.constraint(equalToConstant: Constants.Sizing.textFieldViewHeight),
                                     textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     textField.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        return view
    }
    
    func configureTextField(with placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: Constants.Layout.fontSize)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return textField
    }
}
