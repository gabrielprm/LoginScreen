//
//  Observer.swift
//  LoginScreen
//
//  Created by Lucas Alexandre Amorim Leoncio on 24/02/22.
//

import Foundation
import UIKit

protocol PropertyObserver: AnyObject{
    func updateTime(ind: Int)
}

class TimeObserver{
    var assinantes:[PropertyObserver] = []
    var ind = 1
    init(){
        _ = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { timer in
            self.notifyObservers(ind: self.ind)
            self.ind += 1
            
            if self.ind == 4 {
                self.ind = 1
            }
            
        }
    }
    
    func addAssinante(assinante: PropertyObserver){
        assinantes.append(assinante)
    }
    
    func notifyObservers(ind: Int){
        
        for assinante in assinantes {
            assinante.updateTime(ind: ind)
        }
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
