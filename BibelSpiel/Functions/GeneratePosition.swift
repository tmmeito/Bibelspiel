//
//  GeneratePosition.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 21.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation

// bei Zahlen bis 10 eine 0 voranstellen
func GeneratePosition(wert: Int) -> String {
    var strg = ""
    if wert < 10 {
            strg = "0\(wert)"
    } else {
        strg = "\(wert)"
    }
    return strg
}
