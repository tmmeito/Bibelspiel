//
//  CalculatePositionFortschritt.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 22.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation
import SwiftUI


func CalculatePositionFortschritt(fortschrittArray: FetchedResults<Fortschritt>, spielId: UUID) -> Int {
    
    var position = 0
    
    for i in fortschrittArray.indices {
        //print("\(fortschrittArray[i].fehler) \(fortschrittArray[i].spieldauer) \(fortschrittArray[i].id)")
        if fortschrittArray[i].id == spielId {
            //print("\(fortschrittArray[i].id)")
            position = i
        }
    }

    return position + 1
}
