//
//  HilfenArray.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 18.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation


func HilfenArray(spracheID: Int) -> [Hilfe] {
    
    // schwierigkeitID: 1- einfach, 2- mittel, 3- schwer
    // kategorieID: ohne Verwendung
    // spracheID: 0- deutsch  1- mazedonisch  2- english  3- romani
    
    var hilfenArray = [Hilfe]()

    
    if spracheID == 0 {
        hilfenArray.append(createHilfe(reihenfolgeNr: 1, schwierigkeitID: 1, kategorieID: 0, txt: "Das erste Buch der Bibel."))

        
    } else if spracheID == 1 {
        hilfenArray.append(createHilfe(reihenfolgeNr: 1, schwierigkeitID: 1, kategorieID: 0, txt: "Првата библиска книга."))
        
    }
    
    
    return hilfenArray
}


func createHilfe(reihenfolgeNr: Int, schwierigkeitID: Int, kategorieID: Int, txt: String) -> Hilfe {
    
    var hilfe = Hilfe()
    hilfe.reihenfolgeNr = reihenfolgeNr
    hilfe.schwierigkeitID = schwierigkeitID
    hilfe.kategorieID = kategorieID
    hilfe.txt = txt
    
    return hilfe
}
