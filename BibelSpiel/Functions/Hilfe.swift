//
//  Hilfe.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 18.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation

struct Hilfe: Hashable {
    
    var id = UUID()
    var reihenfolgeNr = 0
    var schwierigkeitID = 0  // 1- einfach, 2- mittel, 3- schwer
    var kategorieID = 0  // 1- Bibelverse, 2- Schreiber, 3- Zeitangaben
    var txt = ""
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(reihenfolgeNr)
    }

}
