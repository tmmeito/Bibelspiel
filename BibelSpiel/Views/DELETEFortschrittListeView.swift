//
//  FortschrittListeView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 18.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct FortschrittListeView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Fortschritt.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Fortschritt.punkte, ascending: false)]) var gespeicherteFortschritte: FetchedResults<Fortschritt>
    @Binding var gefiltert: [Fortschritt]
    
    @ObservedObject var settings = Settings()
    @EnvironmentObject var globals: Globals
    
    init(gefiltert: Binding<[Fortschritt]>) {
        self._gefiltert = gefiltert
        UITableView.appearance().separatorStyle = .singleLine
        UITableView.appearance().tintColor = UIColor.init(named: "Dunkel")
        UITableViewCell.appearance().backgroundColor = UIColor.init(named: "Hell")
        UITableView.appearance().backgroundColor = UIColor.init(named: "Hell")
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack() {
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "punkte"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "fehler"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "zeit"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "bibelteil"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "schwierigkeit"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "hilfe"))")
                    .bold()
                }.frame(width: 75)
                
            }.foregroundColor(Color.init("Dunkel"))
                .padding(.leading, 10)
                .padding(.trailing, 10)
            
            Divider()
            
            List() {
                ForEach(self.gefiltert, id: \.self) { gespeicherterFortschritt in
                    HStack {
                        VStack {
                            Text("\(gespeicherterFortschritt.punkte)")
                        }.frame(width: 75)
                        VStack {
                            Text("\(self.pruefeNull(wert: gespeicherterFortschritt.fehler))")
                        }.frame(width: 75)
                        VStack {
                            Text("\(self.globals.zeitString(sekundenInt: Int(gespeicherterFortschritt.spieldauer)))")
                        }.frame(width: 75)
                        VStack {
                            Text("\(self.abkBibelteil(bibelteil: Int(gespeicherterFortschritt.bibelteil)))")
                        }.frame(width: 75)
                        VStack {
                            Text("\(self.abkSchwierigkeitsgrad(schwierigkeitsgrad: Int(gespeicherterFortschritt.schwierigkeitsgrad)))")
                        }.frame(width: 75)
                        VStack {
                            Text("\(self.pruefeNull(wert: gespeicherterFortschritt.hilfeVerwandt))")
                        }.frame(width: 75)
                    }.foregroundColor(Color.init("Dunkel"))
                }
            }.environment(\.defaultMinListRowHeight, 4)
                .offset(x: -5)
        }.onAppear() {
            self.gefiltert = self.gespeicherteFortschritte.filter { $0.spieler?.name == "\(self.settings.aktuellerSpielerName)" }
        }.padding()
        .overlay(Rectangle().stroke(Color.init("Dunkel"), lineWidth: 1))
    }
    
    
    
    
    
    // Abkürzung für Bibelteil in Ergebnisliste
    func abkBibelteil(bibelteil: Int) -> String {
        
        var strg = ""
        
        if bibelteil == 1 {
            
            strg = "\(TxtBaustein(language: self.settings.language, phrase: "hebraeischeSchriftenAbk"))"
            
        } else if bibelteil == 2 {
            
            strg = "\(TxtBaustein(language: self.settings.language, phrase: "christlichGriechischeSchriftenAbk"))"
            
        } else if bibelteil == 3 {
            
            strg = "\(TxtBaustein(language: self.settings.language, phrase: "kompletteBibelAbk"))"
        }
        
        
        return strg
        
    }
    
    
    // Abkürzung für Schwierigkeitsgrad in Ergebnisliste
    func abkSchwierigkeitsgrad(schwierigkeitsgrad: Int) -> String {
        
        var strg = ""
        
        if schwierigkeitsgrad == 1 {
            
            strg = "\(TxtBaustein(language: self.settings.language, phrase: "einfach"))"
            
        } else if schwierigkeitsgrad == 2 {
            
            strg = "\(TxtBaustein(language: self.settings.language, phrase: "mittel"))"
            
        } else if schwierigkeitsgrad == 3 {
            
            strg = "\(TxtBaustein(language: self.settings.language, phrase: "schwer"))"
        }
        
        
        return strg
        
    }
    
    
    // wenn Null dann "-" zurückgeben
    func pruefeNull(wert: Int16) -> String {
        
        var strg = ""
        
        if wert == 0 {
            strg = "-"
        } else {
            strg = "\(wert)"
        }
        
        return strg
    }
    
    
}


//struct FortschrittListeView_Previews: PreviewProvider {
//    static var previews: some View {
//        FortschrittListeView()
//    }
//}
