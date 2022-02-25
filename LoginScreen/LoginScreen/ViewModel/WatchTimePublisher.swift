//
//  Observer.swift
//  LoginScreen
//
//  Created by Lucas Alexandre Amorim Leoncio on 24/02/22.
//

import UIKit

class WatchTimePublisher{
    var subscribers: [WatchTimeSubscriber] = []
    var ind = 1
    
    init(){
        _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            self.notifySubscribers()
            self.ind += 1
            
            if self.ind == 4 {
                self.ind = 1
            }
            
        }
    }
    
    func subscribe(sub: WatchTimeSubscriber){
        subscribers.append(sub)
    }
    
    func notifySubscribers(){
        
        for sub in subscribers {
            switch self.ind {
                case 1: sub.makeChanges(partOfTheDay: .morning)
                case 2: sub.makeChanges(partOfTheDay: .afternoon)
                default: sub.makeChanges(partOfTheDay: .night)
            }
        }
    }
}
