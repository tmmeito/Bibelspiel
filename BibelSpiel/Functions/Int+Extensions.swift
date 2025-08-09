//
//  Int+Extensions.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 26.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
