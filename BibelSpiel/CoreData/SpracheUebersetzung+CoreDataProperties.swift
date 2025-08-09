//
//  SpracheUebersetzung+CoreDataProperties.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//
//

import Foundation
import CoreData


extension SpracheUebersetzung {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SpracheUebersetzung> {
        return NSFetchRequest<SpracheUebersetzung>(entityName: "SpracheUebersetzung")
    }

    @NSManaged public var lang: String?
    @NSManaged public var sprache: Sprache?
    @NSManaged public var uebersetzteSprache: Sprache?

}
