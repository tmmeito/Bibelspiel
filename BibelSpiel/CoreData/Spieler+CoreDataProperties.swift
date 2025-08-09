//
//  Spieler+CoreDataProperties.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//
//

import Foundation
import CoreData


extension Spieler {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Spieler> {
        return NSFetchRequest<Spieler>(entityName: "Spieler")
    }

    @NSManaged public var name: String?

}
