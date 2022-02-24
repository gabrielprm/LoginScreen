//
//  HeaderViewController.swift
//  LoginScreen
//
//  Created by Luiz Araujo 2022 on 23/02/22.
//

import UIKit

class HeaderViewController: UIViewController {
    
    
    lazy var imageView: UIImageView = {
       let iv = UIImageView()
        
        var i = UIImage(systemName: "background.jpg")
        iv.contentMode =  UIView.ContentMode.scaleAspectFill
        iv.clipsToBounds = true
        iv.image = i
        
        return iv
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.imageView)
        setupConstraints()
    }
    
    
    private func setupConstraints() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: Constants.Sizing.screenHeight * 0.5).isActive = true
    }
}
