//
//  Bibelbuch.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation

struct Bibelbuch: Hashable {
    
    var id = UUID()
    var reihenfolgeNr = 0
    var kurz = ""
    var lang = ""
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(reihenfolgeNr)
    }

}

