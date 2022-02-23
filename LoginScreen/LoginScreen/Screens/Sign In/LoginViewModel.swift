//
//  LoginViewModel.swift
//  LoginScreen
//
//  Created by Gabriel do Prado Moreira on 23/02/22.
//

import Foundation

enum ValidationErrors: LocalizedError {
    case nilValue
    case emailTooSmall
    case emailTooLong
    case invalidEmail
    case passwordTooSmall
    case passwordTooLong
    case notFound
    
    var errorDescription: String? {
        switch self {
            case .nilValue:
                return "Email vazio"
            case .emailTooSmall:
                return "Email muito curto"
            case .emailTooLong:
                return "Email muito longo"
            case .invalidEmail:
                return "Email Invalido"
            case .passwordTooSmall:
                return "Senha muito curta"
            case .passwordTooLong:
                return "Senha muito longa"
            case .notFound:
                return "Email ou Senha Invalidos"
        }
    }
}

struct ValidationServices {
    func validateEmail(with email: String?) throws -> String {
        guard let email = email else { throw ValidationErrors.nilValue }
        guard !email.isEmpty else { throw ValidationErrors.nilValue }
        guard email.count > 3 else { throw ValidationErrors.emailTooSmall }
        guard email.count < 50 else { throw ValidationErrors.emailTooLong }
        guard email.contains("@") && email.contains(".") else { throw ValidationErrors.invalidEmail }
        return email
    }
    
    func validatePassword(with password: String?) throws -> String {
        guard let password = password else { throw ValidationErrors.nilValue }
        guard !password.isEmpty else { throw ValidationErrors.nilValue }
        guard password.count >= 8 else { throw ValidationErrors.passwordTooSmall }
        guard password.count < 20 else { throw ValidationErrors.passwordTooLong }
        return password
    }
}

struct LoginViewModel {
    
    var validationService: ValidationServices
    
    init() {
        validationService = ValidationServices()
    }
    
    func authenticate(withEmail email: String?, withPassword password: String?, completionHandler:  @escaping(Result<Bool, Error>) -> ()) {
        do {
            let email = try validationService.validateEmail(with: email)
            let password = try validationService.validatePassword(with: password)
            
            try checkCredentials(email: email, password: password)
            
            completionHandler(.success(true))
        } catch (let err) {
            guard let err = err as? ValidationErrors else { return }
            completionHandler(.failure(err))
        }
        
    }
    
    private func checkCredentials(email: String, password: String) throws {
        if (UserMock.user.first { user in
            user.password == password && user.email == email
        }) == nil {
            throw ValidationErrors.notFound
        }
    }
    
}
