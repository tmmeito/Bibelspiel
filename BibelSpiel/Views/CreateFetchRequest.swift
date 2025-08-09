//
//  CreateFetchRequest.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 22.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData


func CreateFetchRequest(aktuellerSpielerName: String, bibelteil: Int, schwierigkeitsgrad: Int) -> FetchRequest<Fortschritt> {
    
    var fetchRequest: FetchRequest<Fortschritt>
    
    if aktuellerSpielerName != "" {
        // filtern nach NAME, bibelteil und schwierigkeitsgrad
        if bibelteil > 0 && schwierigkeitsgrad > 0 {
            fetchRequest = FetchRequest<Fortschritt>(
                entity: Fortschritt.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \Fortschritt.punkte, ascending: false)],
                predicate: NSPredicate(format: "spieler.name == %@ AND bibelteil == %ld AND schwierigkeitsgrad == %ld", aktuellerSpielerName, bibelteil, schwierigkeitsgrad))
        }
        // filtern nach name, bibelteil
        else if bibelteil > 0 {
            fetchRequest = FetchRequest<Fortschritt>(
                entity: Fortschritt.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \Fortschritt.punkte, ascending: false)],
                predicate: NSPredicate(format: "spieler.name == %@ AND bibelteil == %ld", aktuellerSpielerName, bibelteil))
        }
        // filtern nach name, schwierigkeitsgrad
        else if schwierigkeitsgrad > 0 {
            fetchRequest = FetchRequest<Fortschritt>(
                entity: Fortschritt.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \Fortschritt.punkte, ascending: false)],
                predicate: NSPredicate(format: "spieler.name == %@ AND schwierigkeitsgrad == %ld", aktuellerSpielerName, schwierigkeitsgrad))
        }
        else {
            // filtern nach name
            fetchRequest = FetchRequest<Fortschritt>(
                entity: Fortschritt.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \Fortschritt.punkte, ascending: false)],
                predicate: NSPredicate(format: "spieler.name == %@", aktuellerSpielerName))
        }
    }
        
    // ohne Spielername - ALLE
    else {
        // filtern nach bibelteil und schwierigkeitsgrad
        if bibelteil > 0 && schwierigkeitsgrad > 0 {
            fetchRequest = FetchRequest<Fortschritt>(
                entity: Fortschritt.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \Fortschritt.punkte, ascending: false)],
                predicate: NSPredicate(format: "bibelteil == %ld AND schwierigkeitsgrad == %ld", bibelteil, schwierigkeitsgrad))
        }
            // filtern nach bibelteil
        else if bibelteil > 0 {
            fetchRequest = FetchRequest<Fortschritt>(
                entity: Fortschritt.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \Fortschritt.punkte, ascending: false)],
                predicate: NSPredicate(format: "bibelteil == %ld", bibelteil))
        }
            // filtern nach schwierigkeitsgrad
        else if schwierigkeitsgrad > 0 {
            fetchRequest = FetchRequest<Fortschritt>(
                entity: Fortschritt.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \Fortschritt.punkte, ascending: false)],
                predicate: NSPredicate(format: "schwierigkeitsgrad == %ld", schwierigkeitsgrad))
        }
        else {
            // ohne Filter
            fetchRequest = FetchRequest<Fortschritt>(
                entity: Fortschritt.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \Fortschritt.punkte, ascending: false)])
        }
    }
    return fetchRequest
}
