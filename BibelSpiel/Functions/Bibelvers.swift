//
//  Bibelvers.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 18.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation


struct Bibelvers: Hashable {
    
    var id = UUID()
    var reihenfolgeNr = 0
    var schwierigkeitID = 0  // 1- einfach, 2- mittel, 3- schwer
    var kategorieID = 0  // wird momentan nicht verwendet
    var kapitelInt = 0
    var versInt = 0
    var txt = ""

    // Gleichheit und Hashwert basieren ausschließlich auf `reihenfolgeNr`.
    // Zwei Bibelverse mit derselben Nummer gelten als identisch, auch wenn
    // sich andere Eigenschaften unterscheiden.
    static func == (lhs: Bibelvers, rhs: Bibelvers) -> Bool {
        lhs.reihenfolgeNr == rhs.reihenfolgeNr
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(reihenfolgeNr)
    }

}
