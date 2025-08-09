//
//  Formatter+Extensions.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 26.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter
    }()
}
