//
//  Observer.swift
//  LoginScreen
//
//  Created by Lucas Alexandre Amorim Leoncio on 24/02/22.
//

import Foundation
import UIKit

protocol PropertyObserver: AnyObject{
    func updateTime(timeInString: String, newObject: AnyObject?)
}

class TimeObserver{
    var assinantes:[PropertyObserver] = []
    
    init(){
        
    }
    
    func addAssinante(assinante: PropertyObserver){
        assinantes.append(assinante)
    }
    
    func notifyObservers(){
        
    }
    
}

class AssinanteA: PropertyObserver{
    func updateTime(timeInString: String, newObject: AnyObject?) {
        print("Assinante B recebeu Att")

    }
}

class AssinanteB: PropertyObserver{
    func updateTime(timeInString: String, newObject: AnyObject?) {
        print("Assinante A recebeu Att")
    }
}

/////Uses the current hour to return the part of the day
//func getCurrentPartOfTheDay() -> PartOfTheDay {
//
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "HH"
//    let hoursMinutesString = dateFormatter.string(from: Date())
//
//    switch Int(hoursMinutesString) ?? 0 {
//    case 5...12:
//        return PartOfTheDay.morning
//
//    case 13...17:
//        return PartOfTheDay.afternoon
//
//    default:
//        return PartOfTheDay.night
//
//    }
//}
