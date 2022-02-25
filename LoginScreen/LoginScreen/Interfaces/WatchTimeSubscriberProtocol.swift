//
//  WatchTimeSubscriber.swift
//  LoginScreen
//
//  Created by Luiz Araujo on 24/02/22.
//

import Foundation

protocol WatchTimeSubscriber: AnyObject{
    func makeChanges(partOfTheDay: PartOfTheDay)
}
