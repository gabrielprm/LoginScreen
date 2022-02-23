//
//  FormViewProtocol.swift
//  LoginScreen
//
//  Created by Luiz Araujo 2022 on 23/02/22.
//

import Foundation

protocol FormViewDelegate: AnyObject {
    func formViewInputs(email: String?, password: String?)
    func changeScreenSignUp()
}
