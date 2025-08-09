//
//  FortschrittFilterView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 21.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct FortschrittFilterView: View {
    
    @Environment(\.managedObjectContext) var moc
    var fetchRequest: FetchRequest<Fortschritt>
    @EnvironmentObject var globals: Globals
    @State var top10 = [Fortschritt]()
    @ObservedObject var settings = Settings()
    
    init(aktuellerSpielerName: String, bibelteil: Int, schwierigkeitsgrad: Int) {
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
        
        UITableView.appearance().separatorStyle = .singleLine
        UITableView.appearance().tintColor = UIColor.init(named: "Dunkel")
        UITableViewCell.appearance().backgroundColor = UIColor.init(named: "Hell")
        UITableView.appearance().backgroundColor = UIColor.init(named: "Hell")
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack() {
                VStack {
                    Text("#")
                    .bold()
                }.frame(width: 35)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "spieler"))")
                    .bold()
                }.frame(width: 130)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "punkte"))")
                    .bold()
                }.frame(width: 87)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "fehler"))")
                    .bold()
                }.frame(width: 65)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "zeit"))")
                    .bold()
                }.frame(width: 65)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "hilfe"))")
                    .bold()
                }.frame(width: 65)
                
            }.foregroundColor(Color.init("Dunkel"))
                .padding(.leading, 10)
                .padding(.trailing, 10)
            
            Divider()
            
            List() {
                ForEach(self.fetchRequest.wrappedValue.indices, id: \.self) { i in
                    HStack {
                        VStack {
                            Text("\(i + 1).")
                        }.frame(width: 35)
                        VStack {
                            Text("\(self.fetchRequest.wrappedValue[i].spieler?.name ?? "-")")
                        }.frame(width: 130)
                        VStack {
                            Text("\(self.fetchRequest.wrappedValue[i].punkte)")
                        }.frame(width: 87)
                        VStack {
                            Text("\(self.fetchRequest.wrappedValue[i].fehler)")
                        }.frame(width: 65)
                        VStack {
                            Text("\(self.globals.zeitString(sekundenInt: Int(self.fetchRequest.wrappedValue[i].spieldauer)))")
                        }.frame(width: 65)
                        VStack {
                            Text("\(self.fetchRequest.wrappedValue[i].hilfeVerwandt)")
                        }.frame(width: 65)
                    }.foregroundColor(self.globals.letztesGespeichertesSpielId == self.fetchRequest.wrappedValue[i].id ? Color.init("Hell") : Color.init("Dunkel"))
                    .background(self.globals.letztesGespeichertesSpielId == self.fetchRequest.wrappedValue[i].id ? Color.init("Dunkel") : Color.init("Hell"))
                }.onDelete(perform: removeFortschritt)
            }.environment(\.defaultMinListRowHeight, 4)
                .offset(x: -5)
        }.padding()
        .overlay(Rectangle().stroke(Color.init("Dunkel"), lineWidth: 1))
//        List(0..<fetchRequest.wrappedValue.count, id: \.self) { i in
//            Text("(\(GeneratePosition(wert: i + 1))) \(self.fetchRequest.wrappedValue[i].spieler?.name ?? "-"): \(self.fetchRequest.wrappedValue[i].punkte)")
//                .foregroundColor(Color.init("Dunkel"))
//        }
//        List(0..<top10.count, id: \.self) { i in
//            Text("(\(GeneratePosition(wert: i + 1))) \(self.top10[i].spieler?.name ?? "-"): \(self.top10[i].punkte)")
//                .foregroundColor(Color.init("Dunkel"))
//        }
    }
    
    
    // Eintrag löschen
    func removeFortschritt(at offsets: IndexSet) {
        
        if self.globals.fortschrittLoeschen {
            for index in offsets {
                let gespFortschr = self.fetchRequest.wrappedValue[index]
                moc.delete(gespFortschr)
                try! moc.save()
            }
        }
    }
    
    
    func aktualisiereTop10() {
        
        // höchstens die ersten 10 Werte für die Anzeige in top10 speichern
        print(self.fetchRequest.wrappedValue.count)
        for i in 0..<self.fetchRequest.wrappedValue.count {
            if i < 10 {
                self.top10.append(self.fetchRequest.wrappedValue[i])
            }
        }
        
    }
}


