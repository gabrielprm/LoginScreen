//
//  User.swift
//  LoginScreen
//
//  Created by Gabriel do Prado Moreira on 23/02/22.
//

import Foundation

struct User {
    var email: String
    var password: String
    var name: String
}

struct UserMock {
    static var user: [User] = [User(email: "asd@gmail.com", password: "123456789", name: "asd")]
}
