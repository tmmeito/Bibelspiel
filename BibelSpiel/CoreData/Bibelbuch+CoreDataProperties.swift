//
//  Bibelbuch+CoreDataProperties.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//
//

import Foundation
import CoreData


extension Bibelbuch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bibelbuch> {
        return NSFetchRequest<Bibelbuch>(entityName: "Bibelbuch")
    }

    @NSManaged public var reihenfolgeNr: Int16
    @NSManaged public var beschreibung: NSSet?
    @NSManaged public var bezeichnung: NSSet?
    @NSManaged public var schreiber: NSSet?

}

// MARK: Generated accessors for beschreibung
extension Bibelbuch {

    @objc(addBeschreibungObject:)
    @NSManaged public func addToBeschreibung(_ value: Beschreibung)

    @objc(removeBeschreibungObject:)
    @NSManaged public func removeFromBeschreibung(_ value: Beschreibung)

    @objc(addBeschreibung:)
    @NSManaged public func addToBeschreibung(_ values: NSSet)

    @objc(removeBeschreibung:)
    @NSManaged public func removeFromBeschreibung(_ values: NSSet)

}

// MARK: Generated accessors for bezeichnung
extension Bibelbuch {

    @objc(addBezeichnungObject:)
    @NSManaged public func addToBezeichnung(_ value: Bezeichnung)

    @objc(removeBezeichnungObject:)
    @NSManaged public func removeFromBezeichnung(_ value: Bezeichnung)

    @objc(addBezeichnung:)
    @NSManaged public func addToBezeichnung(_ values: NSSet)

    @objc(removeBezeichnung:)
    @NSManaged public func removeFromBezeichnung(_ values: NSSet)

}

// MARK: Generated accessors for schreiber
extension Bibelbuch {

    @objc(addSchreiberObject:)
    @NSManaged public func addToSchreiber(_ value: Schreiber)

    @objc(removeSchreiberObject:)
    @NSManaged public func removeFromSchreiber(_ value: Schreiber)

    @objc(addSchreiber:)
    @NSManaged public func addToSchreiber(_ values: NSSet)

    @objc(removeSchreiber:)
    @NSManaged public func removeFromSchreiber(_ values: NSSet)

}
