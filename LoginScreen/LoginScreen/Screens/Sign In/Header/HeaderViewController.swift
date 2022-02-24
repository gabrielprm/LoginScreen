//
//  HeaderViewController.swift
//  LoginScreen
//
//  Created by Luiz Araujo 2022 on 23/02/22.
//

import UIKit

class HeaderViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    let currentPartOfTheDay: PartOfTheDay //Dependence Injection⁉️
    
    //Views Declarations
    lazy var imageView: UIImageView = {
        let background = UIImage(named: "img1")
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = background
        
        return imageView
    }()
    
    
    init(currentPartOfTheDay: PartOfTheDay) {
        self.currentPartOfTheDay = currentPartOfTheDay
        
        super.init(nibName: nil, bundle: nil)
        
        view.addSubview(imageView)
        
        setImageBasedOnCurrentPartOfTheDay()
        setupConstraints()
    }
    
    private func setImageBasedOnCurrentPartOfTheDay() {
        switch currentPartOfTheDay {
            case .morning:
                imageView.image = UIImage(named: "img1")
                
            case .afternoon:
                imageView.image = UIImage(named: "img2")
                
            case .evening, .night:
                imageView.image = UIImage(named: "img3")                
        }
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.widthAnchor.constraint(equalToConstant: Constants.Sizing.screenWidth).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.Sizing.screenHeight * 0.4425).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
