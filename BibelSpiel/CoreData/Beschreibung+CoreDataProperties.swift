//
//  Beschreibung+CoreDataProperties.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//
//

import Foundation
import CoreData


extension Beschreibung {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Beschreibung> {
        return NSFetchRequest<Beschreibung>(entityName: "Beschreibung")
    }

    @NSManaged public var schwierigkeitsgrad: Int16
    @NSManaged public var txt: String?
    @NSManaged public var bibelbuch: Bibelbuch?
    @NSManaged public var sprache: NSSet?

}

// MARK: Generated accessors for sprache
extension Beschreibung {

    @objc(addSpracheObject:)
    @NSManaged public func addToSprache(_ value: Sprache)

    @objc(removeSpracheObject:)
    @NSManaged public func removeFromSprache(_ value: Sprache)

    @objc(addSprache:)
    @NSManaged public func addToSprache(_ values: NSSet)

    @objc(removeSprache:)
    @NSManaged public func removeFromSprache(_ values: NSSet)

}
