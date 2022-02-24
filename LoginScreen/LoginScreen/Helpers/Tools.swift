//
//  Tools.swift
//  LoginScreen
//
//  Created by Luiz Araujo 2022 on 23/02/22.
//

import UIKit

/// Gets a size for the iPhone 13 and make it proportional to any device.
///
/// - Parameters:
///   - value: The number to set the width or height for something.
///
/// - Returns: The value based on the  width of the current device.
func sizeProportional(_ value: CGFloat) -> CGFloat {
    return (UIScreen.main.bounds.width * value) / 390
}

///Uses the current hour to return the part of the day
func getCurrentPartOfTheDay() -> PartOfTheDay {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH"
    let hoursMinutesString = dateFormatter.string(from: Date())

    switch Int(hoursMinutesString) ?? 0 {
    case 5...12:
        return PartOfTheDay.morning
        
    case 13...17:
        return PartOfTheDay.afternoon
        
    default:
        return PartOfTheDay.night
        
    }
}
