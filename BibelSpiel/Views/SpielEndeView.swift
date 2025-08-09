//
//  SpielEndeView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 15.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct SpielEndeView: View {
    
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    @FetchRequest(entity: Spieler.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Spieler.name, ascending: true)]) var spieler: FetchedResults<Spieler>
    
    let hoehe = CGFloat(545)
    let hoeheHintergrundUeberschrift = CGFloat(60)
    let breite = CGFloat(625)
    
    var fetchRequest: FetchRequest<Fortschritt>
    
    @State var anzeigeId = 1
    
    init(bibelteil: Int, schwierigkeitsgrad: Int) {
        fetchRequest = CreateFetchRequest(aktuellerSpielerName: "", bibelteil: bibelteil, schwierigkeitsgrad: schwierigkeitsgrad)
    }
    
    
    var body: some View {
        
        ZStack {
            Color.init("HintergrundTransparent")
            
            // Fenster
            RoundedRectangle(cornerRadius: 20, style: .circular)
                .fill(Color("Hell"))
                .frame(width: self.breite, height: self.hoehe, alignment: .center)
                .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Dunkel"), lineWidth: 4))
            
            // Überschrift Text und Hintergrund
            ZStack() {
                HStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "spielende").uppercased())")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("Hell"))
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                }.frame(width: self.breite, height: self.hoeheHintergrundUeberschrift, alignment: .center)
                    .background(Color("Dunkel"))
                    .offset(x: 0, y: -220)
            }
            
            
            // Fensterinhalt
            HStack {
                SpielEndeBalkenView()
                
                SpielEndeBonusView(anzeigeId: self.$anzeigeId)
                    .padding(.leading, 80)
                
            }.frame(width: 500)
                .offset(x: 15, y: -120)

            
            Text("\(TxtBaustein(language: self.settings.language, phrase: "aufPlatz")) \(CalculatePositionFortschritt(fortschrittArray: self.fetchRequest.wrappedValue, spielId: self.globals.letztesGespeichertesSpielId))")
                .bold()
                .font(.title)
                .foregroundColor(Color.init("Dunkel"))
                .offset(y: -40)
            
            
            FortschrittFilterView(aktuellerSpielerName: "", bibelteil: self.globals.bibelteil, schwierigkeitsgrad: self.globals.schwierigkeitsgrad)
            .frame(width: 500, height: 190)
            .offset(y: 80)
            
            
            // Button
            ButtonKleinView(language: self.settings.language, txtBaustein: "weiter", fontBold: true)
                .offset(y: 220)
        }.onAppear() {
            self.speichern()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                if self.settings.selectedSound == 1 {
                    PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                }
                self.anzeigeId = 2
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                if self.settings.selectedSound == 1 {
                    PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                }
                self.anzeigeId = 3
            }
            
        }
    }
    
    
    // MARK: Fortschritt speichern
    func speichern() {
        self.globals.punkteCache = self.globals.punkte
        
        // Zeitbonus wenn schneller als Referenz
        if self.globals.spielStartDatumInt < self.globals.spieldauerReferenz() {
            self.globals.punkte += (self.globals.spieldauerReferenz() - self.globals.spielStartDatumInt) * self.globals.calculatePluspunkteZeit()
        }
        
        // Spiel in Fortschritte speichern
        let fortschritt = Fortschritt(context: self.moc)
        fortschritt.id = UUID()
        fortschritt.datum = Date()
        fortschritt.spieldauer = Int16(self.globals.spielStartDatumInt)
        fortschritt.schwierigkeitsgrad = Int16(self.globals.schwierigkeitsgrad)
        fortschritt.punkte = Int16(self.globals.punkte)
        fortschritt.hilfeVerwandt = Int16(self.globals.hilfeVerwandt)
        fortschritt.fehler = Int16(self.globals.fehler)
        fortschritt.bibelteil = Int16(self.globals.bibelteil)
        
        // ID für Markierung in Fortschrittsliste speichern
        self.globals.letztesGespeichertesSpielId = fortschritt.id!
        
        for spieler in self.spieler {
        
            if spieler.name == self.settings.aktuellerSpielerName {
                //spieler.addToGespeicherteFortschritte([fortschritt])
                spieler.addToGespeicherteFortschritte(fortschritt)
            }
        }
        
        try! self.moc.save()
    }
}

