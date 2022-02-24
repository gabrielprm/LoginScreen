//
//  Coordinator.swift
//  LoginScreen
//
//  Created by Gabriel do Prado Moreira on 23/02/22.
//

import Foundation
import UIKit

enum Event {
    case signUp
    case signIn
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func eventOcurred(with type: Event)
    func start()
    func moveToSignUpScreen()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
