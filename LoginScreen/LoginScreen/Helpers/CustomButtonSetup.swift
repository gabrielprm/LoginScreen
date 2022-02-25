//
//  ButtonSetup.swift
//  LoginScreen
//
//  Created by Gabriel do Prado Moreira on 23/02/22.
//

import UIKit

class CustomButtonSetup: UIButton {

    var path: UIBezierPath!
    private var color: UIColor
    
    init(frame: CGRect, color: UIColor) {
        self.color = color
        super.init(frame: frame)

       self.backgroundColor = UIColor.clear
    }

    override func draw(_ rect: CGRect) {

        createRectangle()
        backgroundColor = .clear
        self.color.set()
        path.fill()

    }

    func createRectangle() {
        path = UIBezierPath(roundedRect: self.bounds,
                                   byRoundingCorners: [.topLeft, .bottomRight],
                                   cornerRadii: CGSize(width: 30.0, height: 0.0))
        path.close()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
