//
//  Bezeichnung+CoreDataProperties.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//
//

import Foundation
import CoreData


extension Bezeichnung {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bezeichnung> {
        return NSFetchRequest<Bezeichnung>(entityName: "Bezeichnung")
    }

    @NSManaged public var kurz: String?
    @NSManaged public var lang: String?
    @NSManaged public var bibelbuch: Bibelbuch?
    @NSManaged public var sprache: Sprache?

}
