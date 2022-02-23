//
//  ButtonSetup.swift
//  LoginScreen
//
//  Created by Gabriel do Prado Moreira on 23/02/22.
//

import UIKit

class CustomButtonSetup: UIButton {

    var path: UIBezierPath!

    override init(frame: CGRect) {
        super.init(frame: frame)

       self.backgroundColor = UIColor.clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {

        createRectangle()
        backgroundColor = .clear
        UIColor.brown.set()
        path.fill()

    }

    func createRectangle() {
        path = UIBezierPath(roundedRect: self.bounds,
                                   byRoundingCorners: [.topLeft, .bottomRight],
                                   cornerRadii: CGSize(width: 30.0, height: 0.0))
//        UIColor.rgb(red: 188, green: 196, blue: 247).set()
        path.close()
    }
}
