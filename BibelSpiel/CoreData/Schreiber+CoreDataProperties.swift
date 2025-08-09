//
//  Schreiber+CoreDataProperties.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//
//

import Foundation
import CoreData


extension Schreiber {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Schreiber> {
        return NSFetchRequest<Schreiber>(entityName: "Schreiber")
    }

    @NSManaged public var name: String?
    @NSManaged public var bibelbuch: NSSet?
    @NSManaged public var sprache: NSSet?

}

// MARK: Generated accessors for bibelbuch
extension Schreiber {

    @objc(addBibelbuchObject:)
    @NSManaged public func addToBibelbuch(_ value: Bibelbuch)

    @objc(removeBibelbuchObject:)
    @NSManaged public func removeFromBibelbuch(_ value: Bibelbuch)

    @objc(addBibelbuch:)
    @NSManaged public func addToBibelbuch(_ values: NSSet)

    @objc(removeBibelbuch:)
    @NSManaged public func removeFromBibelbuch(_ values: NSSet)

}

// MARK: Generated accessors for sprache
extension Schreiber {

    @objc(addSpracheObject:)
    @NSManaged public func addToSprache(_ value: Sprache)

    @objc(removeSpracheObject:)
    @NSManaged public func removeFromSprache(_ value: Sprache)

    @objc(addSprache:)
    @NSManaged public func addToSprache(_ values: NSSet)

    @objc(removeSprache:)
    @NSManaged public func removeFromSprache(_ values: NSSet)

}
