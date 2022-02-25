//
//  HeaderViewController.swift
//  LoginScreen
//
//  Created by Luiz Araujo 2022 on 23/02/22.
//

import UIKit

class HeaderViewController: UIViewController, Coordinating, WatchTimeSubscriber {
    
    var coordinator: Coordinator?
    
    let currentPartOfTheDay: PartOfTheDay
    
    var imageView: MountainView
    
    init(currentPartOfTheDay: PartOfTheDay) {
        self.currentPartOfTheDay = currentPartOfTheDay
        self.imageView = MountainView(frame: UIScreen.main.bounds, partOftTheDay: currentPartOfTheDay)
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.addSubview(self.imageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.widthAnchor.constraint(equalToConstant: Constants.Sizing.screenWidth).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.Sizing.screenHeight * 0.4425).isActive = true
    }
    
    //MARK: - PROTOCOLS
    func makeChanges(partOfTheDay: PartOfTheDay) {
        imageView.setPartOftTheDay(partOfTheDay)
        imageView.updateShapeLayers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
