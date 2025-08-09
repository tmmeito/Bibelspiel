//
//  Sprache+CoreDataProperties.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//
//

import Foundation
import CoreData


extension Sprache {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sprache> {
        return NSFetchRequest<Sprache>(entityName: "Sprache")
    }

    @NSManaged public var kurz: String?
    @NSManaged public var lang: String?
    @NSManaged public var beschreibung: NSSet?
    @NSManaged public var bezeichnung: NSSet?
    @NSManaged public var inSpracheUebersetzt: NSSet?
    @NSManaged public var schreiber: NSSet?
    @NSManaged public var spracheUebersetzung: NSSet?

}

// MARK: Generated accessors for beschreibung
extension Sprache {

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
extension Sprache {

    @objc(addBezeichnungObject:)
    @NSManaged public func addToBezeichnung(_ value: Bezeichnung)

    @objc(removeBezeichnungObject:)
    @NSManaged public func removeFromBezeichnung(_ value: Bezeichnung)

    @objc(addBezeichnung:)
    @NSManaged public func addToBezeichnung(_ values: NSSet)

    @objc(removeBezeichnung:)
    @NSManaged public func removeFromBezeichnung(_ values: NSSet)

}

// MARK: Generated accessors for inSpracheUebersetzt
extension Sprache {

    @objc(addInSpracheUebersetztObject:)
    @NSManaged public func addToInSpracheUebersetzt(_ value: SpracheUebersetzung)

    @objc(removeInSpracheUebersetztObject:)
    @NSManaged public func removeFromInSpracheUebersetzt(_ value: SpracheUebersetzung)

    @objc(addInSpracheUebersetzt:)
    @NSManaged public func addToInSpracheUebersetzt(_ values: NSSet)

    @objc(removeInSpracheUebersetzt:)
    @NSManaged public func removeFromInSpracheUebersetzt(_ values: NSSet)

}

// MARK: Generated accessors for schreiber
extension Sprache {

    @objc(addSchreiberObject:)
    @NSManaged public func addToSchreiber(_ value: Schreiber)

    @objc(removeSchreiberObject:)
    @NSManaged public func removeFromSchreiber(_ value: Schreiber)

    @objc(addSchreiber:)
    @NSManaged public func addToSchreiber(_ values: NSSet)

    @objc(removeSchreiber:)
    @NSManaged public func removeFromSchreiber(_ values: NSSet)

}

// MARK: Generated accessors for spracheUebersetzung
extension Sprache {

    @objc(addSpracheUebersetzungObject:)
    @NSManaged public func addToSpracheUebersetzung(_ value: SpracheUebersetzung)

    @objc(removeSpracheUebersetzungObject:)
    @NSManaged public func removeFromSpracheUebersetzung(_ value: SpracheUebersetzung)

    @objc(addSpracheUebersetzung:)
    @NSManaged public func addToSpracheUebersetzung(_ values: NSSet)

    @objc(removeSpracheUebersetzung:)
    @NSManaged public func removeFromSpracheUebersetzung(_ values: NSSet)

}
