//
//  MountainView.swift
//  MountainBuilder
//
//  Created by Luiz Araujo 2022 on 24/02/22.
//

import UIKit

class MountainView: UIView {
    private var partOftTheDay: PartOfTheDay = .morning
    private var isProcedural: Bool
    private var colors = ["": UIColor.white.cgColor]
    
    private var path: UIBezierPath!
    
    private var background = CAShapeLayer()
    private var mountainA  = CAShapeLayer()
    private var mountainB  = CAShapeLayer()
    private var mountainC  = CAShapeLayer()
    private var mountainD  = CAShapeLayer()
    
    private var elevation: CGFloat = 0
    
    init(frame: CGRect, partOftTheDay: PartOfTheDay, isProcedural: Bool = true) {
        self.isProcedural  = isProcedural
        self.partOftTheDay = partOftTheDay
        
        super.init(frame: frame)
        
        updateShapeLayers()
        addSublayers()
    }
    
    internal func updateShapeLayers(){
        setColors()
        
        background.path = createBackground().path
        mountainA.path  = createMountain(layer: "layerA").path
        mountainB.path  = createMountain(layer: "layerB", maxHeight: 300, minHeight: 150.0).path
        mountainC.path  = createMountain(layer: "layerC", maxHeight: 350, minHeight: 200).path
        mountainD.path  = createMountain(layer: "layerD", maxHeight: 400, minHeight: 250).path
        
        background.fillColor = colors["background"]
        mountainA.fillColor  = colors["layerA"]
        mountainB.fillColor  = colors["layerB"]
        mountainC.fillColor  = colors["layerC"]
        mountainD.fillColor  = colors["layerD"]
        
        self.layer.display()
    }
     
    private func addSublayers() {
        self.layer.addSublayer(background)
        self.layer.addSublayer(mountainA)
        self.layer.addSublayer(mountainB)
        self.layer.addSublayer(mountainC)
        self.layer.addSublayer(mountainD)
    }
    
    func setPartOftTheDay(_ part: PartOfTheDay) {
        self.partOftTheDay = part
    }
    
    
    func getPartOftTheDay() -> PartOfTheDay {
        return self.partOftTheDay
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
         
        // Close the path. This will create the last line automatically.
        path.close()
        
        let background       = CAShapeLayer()
        background.path      = self.path.cgPath
        background.fillColor = colors["background"]
        
        return background
    }
    
    
    //MARK: - CREATE MOUNTAINS
    
    private func createMountain(layer: String, maxHeight: CGFloat = 250.0, minHeight: CGFloat = 100.0) -> CAShapeLayer {
        
        proceduralMountainPath(maxHeight: maxHeight, minHeight: minHeight)
        
        let mountain       = CAShapeLayer()
        mountain.path      = self.path.cgPath
        mountain.fillColor = colors[layer]
        
        return mountain
    }
    
    private func proceduralMountainPath(maxHeight: CGFloat = 250.0, minHeight: CGFloat = 100.0) {
        // Reset the path.
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        let startPoint = CGPoint(x: 0.0, y: elevation + Double(Int.random(in: 10...30)) * 10.0)
        var nextPoint = startPoint
        
        
        //Move to initial position
        path.move(to: startPoint)
         
        //Add the left line/side
        path.addLine(to: CGPoint(x: 0.0, y: elevation + self.frame.size.height * 2.26))
         
        //Add the bottom line/side
        path.addLine(to: CGPoint(x: self.frame.size.width , y: elevation + self.frame.size.height * 2.26))
        
        //Add the right line/side
        path.addLine(to: CGPoint(x: self.frame.size.width, y: elevation + CGFloat.random(in: minHeight...maxHeight)))
        
        
        //Mountains
        nextPoint = CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.90...0.99), y: elevation + maxHeight)
        path.addLine(to: nextPoint)
         
        nextPoint = CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.80...89), y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
         
        nextPoint = CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.77...0.79), y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
         
        nextPoint = CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.60...0.69), y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
         
        nextPoint = CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.50...0.59), y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
         
        nextPoint = CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.40...0.49), y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
         
        nextPoint = CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.30...0.39), y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
         
        nextPoint = CGPoint(x: self.frame.size.width * CGFloat.random(in: 0.20...0.29), y: elevation + CGFloat.random(in: minHeight...maxHeight))
        path.addLine(to: nextPoint)
         
        // Close the path. This will create the last line automatically.
        path.close()
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
    func getColors() -> [String: CGColor] {
        return self.colors
    }
    
    
    //MARK: - CREATE SUN/MOON
    private func createCircle() {
        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,
                                                y: elevation + 0.0,
                                                width: self.frame.size.height,
                                                height: self.frame.size.height))
        
        let shapeLayer       = CAShapeLayer()
        shapeLayer.path      = self.path.cgPath
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
