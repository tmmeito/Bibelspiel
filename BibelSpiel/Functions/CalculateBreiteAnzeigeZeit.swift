//
//  CalculateBreiteAnzeigeZeit.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 18.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation
import SwiftUI


public func CalculateBreiteAnzeigeZeit(breite: CGFloat, spielStartDatumInt: Int, spieldauerReferenz: Int) -> CGFloat {
    guard spieldauerReferenz > 0 else { return 0 }

    var prozent = spielStartDatumInt * 100 / spieldauerReferenz
    
    if prozent > 100 {
        prozent = 100
    }
    
    return CGFloat((Int(breite) - 14) * Int(prozent) / 100)
}
