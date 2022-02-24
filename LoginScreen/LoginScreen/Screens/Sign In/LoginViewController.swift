//
//  LoginViewController.swift
//  LoginScreen
//
//  Created by Gabriel do Prado Moreira on 23/02/22.
//

import UIKit

class LoginViewController: UIViewController, Coordinating {
    //MARK: - Properties
    
    var coordinator: Coordinator?
    
    var viewModel: LoginViewModel
    
    var formView: FormViewController
    var headerViewController: HeaderViewController
    
    
    //MARK: - Life Cycle
    convenience init() {
        self.init(nibName:nil, bundle:nil)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = LoginViewModel()
        formView = FormViewController()
        headerViewController = HeaderViewController(currentPartOfTheDay: getCurrentPartOfTheDay())
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.view.addSubview(formView.view)
        self.view.addSubview(headerViewController.imageView)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = true
        
        ///Sets self as "delegator", receiver of data inputed on the FormViewController
        self.formView.loginViewDelegate = self
    }
}


extension LoginViewController: FormViewDelegate {

    /// Delegates bringing data from FormView Textfields
    ///
    /// - Parameters:
    ///   - email: email inserted by users.
    ///   - password: password inserted by users.
    func formViewInputs(email: String?, password: String?) {
        viewModel.authenticate(withEmail: email, withPassword: password) { result in
            switch result {
                case .success:
                    self.coordinator?.eventOcurred(with: .signUp)
                case .failure(let err):
                    let alert = UIAlertController(title: err.localizedDescription, message: err.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
            }
        }
    }

    func changeScreenSignUp() {
        coordinator?.eventOcurred(with: .signUp)
    }
}
