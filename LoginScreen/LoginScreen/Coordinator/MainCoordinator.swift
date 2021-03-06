//
//  MainCoordinator.swift
//  LoginScreen
//
//  Created by Gabriel do Prado Moreira on 23/02/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    func eventOcurred(with type: Event) {
        switch type {
            case .start:
                start()
            case .signIn:
                moveToSignInScreen()
            case .signUp:
                moveToSignUpScreen()
        }
    }
    
    
    func start() {
        
        var vc: UIViewController & Coordinating = LoginViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    private func moveToSignInScreen() {
        
        var vc: UIViewController & Coordinating = LoginViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    private func moveToSignUpScreen() {
        
        var vc: UIViewController & Coordinating = RegisterViewController()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
