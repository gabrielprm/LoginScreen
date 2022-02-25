//
//  MountainView.swift
//  MountainBuilder
//
//  Created by Luiz Araujo 2022 on 24/02/22.
//

import UIKit

class MountainView: UIView {
    
    var path: UIBezierPath!
    
    var isProcedural: Bool
    var partOftTheDay: PartOfTheDay = .morning
    var colors: [String: CGColor] = ["": UIColor.white.cgColor]
    
    var elevation: CGFloat = 0
    
    var background = CAShapeLayer()
    var mountainA = CAShapeLayer()
    var mountainB = CAShapeLayer()
    var mountainC = CAShapeLayer()
    var mountainD = CAShapeLayer()
    
    
    init(frame: CGRect, partOftTheDay: PartOfTheDay, isProcedural: Bool = true) {
        self.isProcedural = isProcedural
        self.partOftTheDay = partOftTheDay
        super.init(frame: frame)
        
        updateshapeLayers()
        
        self.layer.addSublayer(background)
        self.layer.addSublayer(mountainA)
        self.layer.addSublayer(mountainB)
        self.layer.addSublayer(mountainC)
        self.layer.addSublayer(mountainD)
    }
    
    func updateshapeLayers(){
        
        setColors()
        background.path = createBackground().path
        mountainA.path = createMountainA().path
        mountainB.path = createMountainB().path
        mountainC.path = createMountainC().path
        mountainD.path = createMountainD().path
        
        background.fillColor = colors["background"]
        mountainA.fillColor = colors["layerA"]
        mountainB.fillColor = colors["layerB"]
        mountainC.fillColor = colors["layerC"]
        mountainD.fillColor = colors["layerD"]
        
        self.layer.display()
        
    }
    
    //MARK: - CREATE Background
    private func createBackground() -> CAShapeLayer {
        // Initialize the path.
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        
        
        let startPoint = CGPoint(x: 0.0, y: 0.0)
        
        path.move(to: startPoint)
        
        
        //Add the left line/side
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        
        //Add the bottom line/side
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        //Add the bottom line/side
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        
        
        
        // Back to beginning
        path.addLine(to: startPoint)
        
        
        // Close the path. This will create the last line automatically.
        path.close()
        
        
        
        let background = CAShapeLayer()
        background.path = self.path.cgPath
        
        background.fillColor = colors["background"]
        
        return background
        
    }
    
    
    
    //MARK: - CREATE MOUNTAINS
    func proceduralMountainPath(maxHeight: CGFloat = 250.0, minHeight: CGFloat = 100.0) {
        // Reset the path.
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        
        
        let startPoint = CGPoint(x: 0.0,
                                 y: elevation + Double(Int.random(in: 10...30)) * 10.0)
        var nextPoint = startPoint
        
        
        path.move(to: startPoint)
        
        
        //Add the left line/side
        path.addLine(to: CGPoint(x: 0.0, y: elevation + self.frame.size.height))
        
        
        //Add the bottom line/side
        path.addLine(to: CGPoint(x: self.frame.size.width, y: elevation + self.frame.size.height))
        
        //Add the right line/side
        path.addLine(to: CGPoint(x: self.frame.size.width,
                                 y: elevation + CGFloat.random(in: minHeight...maxHeight))
        )
        
        
        //Mountains
        nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.90...0.99),
                             y: elevation + maxHeight)
        path.addLine(to: nextPoint)
        
        
        nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.80...89),
                             y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
        
        
        
        
        nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.77...0.79),
                             y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
        
        
        nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.60...0.69),
                             y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
        
        
        
        
        nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.50...0.59),
                             y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
        
        
        nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.40...0.49),
                             y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
        
        
        
        
        nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.30...0.39),
                             y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
        
        
        nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.20...0.29),
                             y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
        
        
        // Back to beginning
        path.addLine(to: startPoint)
        
        
        // Close the path. This will create the last line automatically.
        path.close()
    }
    
    private func createMountainA() -> CAShapeLayer {
        //        self.mountainA?.removeFromSuperlayer()
        
        if self.isProcedural {
            proceduralMountainPath()
        } else {
            
            let frameHeight: CGFloat = self.frame.size.height
            let frameWidth: CGFloat = self.frame.size.width
            
            path = UIBezierPath()
            
            // Specify the point that the path should start get drawn.
            
            
            let startPoint = CGPoint(x: 0.0,
                                     y: elevation + frameHeight * 0.9
            )
            var nextPoint = startPoint
            
            
            path.move(to: startPoint)
            
            
            //Add the left line/side
            path.addLine(to: CGPoint(x: 0.0, y: elevation + frameHeight))
            
            
            //Add the bottom line/side
            path.addLine(to: CGPoint(x: self.frame.size.width, y: elevation + frameHeight))
            
            //Add the right line/side
            //            path.addLine(to: CGPoint(x: self.frame.size.width,
            //                                     y: elevation + frameHeight * 0.95)
            //            )
            
            
            //Mountains
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.80...0.89),
                                 y: elevation + frameHeight * 0.9)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.77...0.79),
                                 y: elevation + frameHeight * 0.85)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.60...0.69),
                                 y: elevation + frameHeight * 0.9)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.50...0.59),
                                 y: elevation + frameHeight * 0.8)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.40...0.49),
                                 y: elevation + frameHeight * 0.95)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.30...0.39),
                                 y: elevation + frameHeight * 0.9)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.20...0.29),
                                 y: elevation + frameHeight)
            path.addLine(to: nextPoint)
            
            
            // Back to beginning
            path.addLine(to: startPoint)
            
            
            // Close the path. This will create the last line automatically.
            path.close()
        }
        
        let mountain = CAShapeLayer()
        mountain.path = self.path.cgPath
        
        mountain.fillColor = colors["layerA"]
        
        return mountain
    }
    
    private func createMountainB() -> CAShapeLayer {
        if self.isProcedural {
            proceduralMountainPath(maxHeight: 300, minHeight: 150.0)
            
        } else {
            
            let frameHeight: CGFloat = self.frame.size.height
            let frameWidth: CGFloat = self.frame.size.width
            
            path = UIBezierPath()
            
            // Specify the point that the path should start get drawn.
            
            
            let startPoint = CGPoint(x: 0.0,
                                     y: elevation + frameHeight * 0.8
            )
            var nextPoint = startPoint
            
            
            path.move(to: startPoint)
            
            
            //Add the left line/side
            path.addLine(to: CGPoint(x: 0.0, y: elevation + frameHeight))
            
            
            //Add the bottom line/side
            path.addLine(to: CGPoint(x: self.frame.size.width, y: elevation + frameHeight))
            
            //Add the right line/side
            //            path.addLine(to: CGPoint(x: self.frame.size.width,
            //                                     y: elevation + frameHeight * 0.95)
            //            )
            
            
            //Mountains
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.80...89),
                                 y: elevation + frameHeight * 0.9)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.77...0.79),
                                 y: elevation + frameHeight * 0.75)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.60...0.69),
                                 y: elevation + frameHeight * 0.8)
            path.addLine(to: nextPoint)
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.50...0.59),
                                 y: elevation + frameHeight * 0.7)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.40...0.49),
                                 y: elevation + frameHeight * 0.85)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.30...0.39),
                                 y: elevation + frameHeight * 0.8)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.20...0.29),
                                 y: elevation + frameHeight * 0.9)
            path.addLine(to: nextPoint)
            
            
            // Back to beginning
            path.addLine(to: startPoint)
            
            
            // Close the path. This will create the last line automatically.
            path.close()
        }
        
        
        
        let mountain = CAShapeLayer()
        mountain.path = self.path.cgPath
        
        mountain.fillColor = colors["layerB"]
        
        return mountain
    }
    
    private func createMountainC() -> CAShapeLayer {
        if self.isProcedural {
            proceduralMountainPath(maxHeight: 350, minHeight: 200)
            
        } else {
            
            let frameHeight: CGFloat = self.frame.size.height
            let frameWidth: CGFloat = self.frame.size.width
            
            path = UIBezierPath()
            
            // Specify the point that the path should start get drawn.
            
            
            let startPoint = CGPoint(x: 0.0,
                                     y: elevation + frameHeight * 0.7
            )
            var nextPoint = startPoint
            
            
            path.move(to: startPoint)
            
            
            //Add the left line/side
            path.addLine(to: CGPoint(x: 0.0, y: elevation + frameHeight))
            
            
            //Add the bottom line/side
            path.addLine(to: CGPoint(x: self.frame.size.width, y: elevation + frameHeight))
            
            //Add the right line/side
            //            path.addLine(to: CGPoint(x: self.frame.size.width,
            //                                     y: elevation + frameHeight * 0.95)
            //            )
            
            
            //Mountains
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.80...89),
                                 y: elevation + frameHeight * 0.8)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.77...0.79),
                                 y: elevation + frameHeight * 0.65)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.60...0.69),
                                 y: elevation + frameHeight * 0.7)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.50...0.59),
                                 y: elevation + frameHeight * 0.6)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.40...0.49),
                                 y: elevation + frameHeight * 0.75)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.30...0.39),
                                 y: elevation + frameHeight * 0.7)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.20...0.29),
                                 y: elevation + frameHeight * 0.8)
            path.addLine(to: nextPoint)
            
            
            // Back to beginning
            path.addLine(to: startPoint)
            
            
            // Close the path. This will create the last line automatically.
            path.close()
        }
        
        let mountain = CAShapeLayer()
        mountain.path = self.path.cgPath
        
        mountain.fillColor = colors["layerC"]
        
        return mountain
    }
    
    private func createMountainD() -> CAShapeLayer {
        if self.isProcedural {
            proceduralMountainPath(maxHeight: 400, minHeight: 250)
        } else {
            let frameHeight: CGFloat = self.frame.size.height
            let frameWidth: CGFloat = self.frame.size.width
            
            path = UIBezierPath()
            
            // Specify the point that the path should start get drawn.
            
            
            let startPoint = CGPoint(x: 0.0,
                                     y: elevation + frameHeight * 0.6
            )
            var nextPoint = startPoint
            
            
            path.move(to: startPoint)
            
            
            //Add the left line/side
            path.addLine(to: CGPoint(x: 0.0, y: elevation + frameHeight))
            
            
            //Add the bottom line/side
            path.addLine(to: CGPoint(x: self.frame.size.width, y: elevation + frameHeight))
            
            //Add the right line/side
            //            path.addLine(to: CGPoint(x: self.frame.size.width,
            //                                     y: elevation + frameHeight * 0.95)
            //            )
            
            
            //Mountains
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.80...89),
                                 y: elevation + frameHeight * 0.7)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.77...0.79),
                                 y: elevation + frameHeight * 0.55)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.60...0.69),
                                 y: elevation + frameHeight * 0.6)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.50...0.59),
                                 y: elevation + frameHeight * 0.5)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.40...0.49),
                                 y: elevation + frameHeight * 0.65)
            path.addLine(to: nextPoint)
            
            
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.30...0.39),
                                 y: elevation + frameHeight * 0.6)
            path.addLine(to: nextPoint)
            
            
            nextPoint =  CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.20...0.29),
                                 y: elevation + frameHeight * 0.7)
            path.addLine(to: nextPoint)
            
            
            // Back to beginning
            path.addLine(to: startPoint)
            
            
            // Close the path. This will create the last line automatically.
            path.close()
        }
        
        
        
        let mountain = CAShapeLayer()
        mountain.path = self.path.cgPath
        
        mountain.fillColor = colors["layerD"]
        
        return mountain
    }
    
    
    
    //MARK: - COLORS
    func setColors() {
        
        self.colors = [
            "astro":  UIColor(named: "circle_\(self.partOftTheDay.rawValue)")!.cgColor,
            "clouds": UIColor(named: "clouds")!.cgColor,
            "background": UIColor(named: "bg_\(self.partOftTheDay.rawValue)")!.cgColor,
            "layerA": UIColor(named: "mountain_A_\(self.partOftTheDay.rawValue)")!.cgColor,
            "layerB": UIColor(named: "mountain_B_\(self.partOftTheDay.rawValue)")!.cgColor,
            "layerC": UIColor(named: "mountain_C_\(self.partOftTheDay.rawValue)")!.cgColor,
            "layerD": UIColor(named: "mountain_D_\(self.partOftTheDay.rawValue)")!.cgColor
        ]
    }
    
    
    
    
    
    //MARK: - CREATE SUN/MOON
    private func createCircle() {
        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,
                                                y: elevation + 0.0,
                                                width: self.frame.size.height,
                                                height: self.frame.size.height))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.path.cgPath
        
        self.layer.addSublayer(shapeLayer)
        
        shapeLayer.fillColor = colors["layerA"]
        
        self.layer.addSublayer(shapeLayer)
    }
    
    
    //MARK: - CREATE CLOUDS
    private func createClouds() {
        
    }
    override func draw(_ rect: CGRect) {
        //        createContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
