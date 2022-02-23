//
//  Enums.swift
//  LoginScreen
//
//  Created by Gabriel do Prado Moreira on 23/02/22.
//

import Foundation
import UIKit

enum Constants {
    enum Texts {
        static let title = "Hello"
        static let subTitle = "Lorem Ipsum is simply dummy text simply dummy text"
        static let email = "Email"
        static let password = "Password"
    }

    enum Layout {
        static let stackSpacing: CGFloat = 20
    }

    enum Sizing {
        static let stackWidht: CGFloat = 200
        static let textFieldViewWidth: CGFloat = UIScreen.main.bounds.width * 0.9
        static let textFieldViewHeight: CGFloat = UIScreen.main.bounds.width * 0.15
        static let fontSize: CGFloat = 16
    }
}
