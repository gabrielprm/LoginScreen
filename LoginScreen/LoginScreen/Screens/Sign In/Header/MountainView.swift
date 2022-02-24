//
//  MountainView.swift
//  MountainBuilder
//
//  Created by Luiz Araujo 2022 on 24/02/22.
//

import UIKit

class MountainView: UIView {

    var path: UIBezierPath!
    
    var partOftTheDay: PartOfTheDay = .morning
    var colors: [String: CGColor] = ["": UIColor.white.cgColor]
    
    var elevation: CGFloat = 100.0
    
    var proceduralMountainPath: CAShapeLayer?
    var background: CAShapeLayer?
    var mountainA: CAShapeLayer?
    var mountainB: CAShapeLayer?
    var mountainC: CAShapeLayer?
    var mountainD: CAShapeLayer?
    
    
    init(frame: CGRect, partOftTheDay: PartOfTheDay) {
        self.partOftTheDay = partOftTheDay
        super.init(frame: frame)
        
           self.backgroundColor = UIColor.clear
//        self.backgroundColor = UIColor.darkGray
        update()
        
                
//        createCircle()
    }
    
    func update(){
        setColors()

        createBackground()
        
        mountainA?.removeFromSuperlayer()
        mountainB?.removeFromSuperlayer()
        mountainC?.removeFromSuperlayer()
        mountainD?.removeFromSuperlayer()
        createMountainA(procedural: true)
        createMountainB(procedural: true)
        createMountainC(procedural: true)
        createMountainD(procedural: true)
    }
    
    override func draw(_ rect: CGRect) {
//        createContainer()
    }
    
    
    //MARK: - CREATE Background
    private func createBackground() {
        // Initialize the path.
        path = UIBezierPath()
     
        // Specify the point that the path should start get drawn.
        
        
        let startPoint = CGPoint(x: 0.0,
                                 y: 0.0
        )
        
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
        
        
        
        background = CAShapeLayer()
        background!.path = self.path.cgPath
     
        self.layer.addSublayer(background!)
        
        background!.fillColor = colors["background"]
         
        self.layer.addSublayer(background!)
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
    
    
    
    //MARK: - CREATE MOUNTAINS
    func proceduralMountainPath(maxHeight: CGFloat = 250.0, minHeight: CGFloat = 100.0) {
        // Reset the path.
        path = UIBezierPath()
     
        // Specify the point that the path should start get drawn.
        
        
        let startPoint = CGPoint(x: 0.0,
                                 y: elevation + Double(Int.random(in: 10...30)) * 10.0
        )
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
        
        proceduralMountainPath = CAShapeLayer()
        proceduralMountainPath!.path = self.path.cgPath
     
        self.layer.addSublayer(proceduralMountainPath!)
        
        proceduralMountainPath!.fillColor = colors["layerA"]
         
        self.layer.addSublayer(proceduralMountainPath!)
    }
    
    private func createMountainA(procedural: Bool = false) {
        if procedural {
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
        
        mountainA = CAShapeLayer()
        mountainA!.path = self.path.cgPath
     
        self.layer.addSublayer(mountainA!)
        
        mountainA!.fillColor = colors["layerA"]
         
        
        self.layer.addSublayer(mountainA!)
    }
    
    private func createMountainB(procedural: Bool = false) {
        if procedural {
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
        
        
        mountainB = CAShapeLayer()
        mountainB!.path = self.path.cgPath
     
        self.layer.addSublayer(mountainB!)
        
        mountainB!.fillColor = colors["layerB"]
         
        self.layer.addSublayer(mountainB!)
    }
    
    private func createMountainC(procedural: Bool = false) {
        if procedural {
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
        
        mountainC = CAShapeLayer()
        mountainC!.path = self.path.cgPath
     
        self.layer.addSublayer(mountainC!)
        
        mountainC!.fillColor = colors["layerC"]
         
        self.layer.addSublayer(mountainC!)
    }
    
    private func createMountainD(procedural: Bool = false) {
        if procedural {
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
        
        mountainD = CAShapeLayer()
        mountainD!.path = self.path.cgPath
        
        self.layer.addSublayer(mountainD!)
        
        mountainD!.fillColor = colors["layerD"]
        
        self.layer.addSublayer(mountainD!)
    }
    
    
    
    //MARK: - COLORS
    func setColors() {
        var assetSuffix = 0
        
        switch self.partOftTheDay {
        case .morning:
            assetSuffix = 1

        case .afternoon:
            assetSuffix = 2

        case .evening, .night:
            assetSuffix = 3

        }
        
        self.colors = [
            "background": UIColor(named: "bg_\(assetSuffix)")!.cgColor,
            "astro":  UIColor(named: "circle_\(assetSuffix)")!.cgColor,
            "clouds": UIColor(named: "clouds")!.cgColor,
            "layerA": UIColor(named: "mountain_A_\(assetSuffix)")!.cgColor,
            "layerB": UIColor(named: "mountain_B_\(assetSuffix)")!.cgColor,
            "layerC": UIColor(named: "mountain_C_\(assetSuffix)")!.cgColor,
            "layerD": UIColor(named: "mountain_D_\(assetSuffix)")!.cgColor
        ]
    }
    
    
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}



///The parts of the Day based o the hour
//enum PartOfTheDay: Int {
//    case morning = 0
//    case afternoon
//    case evening
//    case night
//}
