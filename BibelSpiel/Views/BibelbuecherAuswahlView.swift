//
//  BibelbuecherAuswahlView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 12.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct BibelbuecherAuswahlView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings.shared
    
    let breite = CGFloat(0.26)
    let hoehe = CGFloat(0.5)
    let eckenRadius = CGFloat(20)
    
    var body: some View {
        
        GeometryReader { geometry in
        
        ZStack {
            // Hintergrund und Umrandung  w:235
            RoundedRectangle(cornerRadius: 20, style: .circular)
                .fill(Color("Hell"))
                .frame(width: geometry.size.width * self.breite, height: geometry.size.height * self.hoehe, alignment: .center)
                .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                .overlay(RoundedRectangle(cornerRadius: self.eckenRadius).stroke(Color("Dunkel"), lineWidth: 4))
            
            // Infoleiste mit Beschriftung
            ZStack() {
                HStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "naechsteBibelbuch"))")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("Hell"))
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                }.frame(width: geometry.size.width * self.breite, height: (geometry.size.height * (self.hoehe - 0.1)) * 0.11, alignment: .center)
                    .background(Color("Dunkel"))
                    .offset(x: 0, y: -(geometry.size.height * 0.2))
                    .onTapGesture(count: 2) {
                        self.globals.cheatNaechstesBB.toggle()
                        self.globals.cheatHilfe.toggle()
                    }
                
                
                VorhandeneBBuecherArray()
                    .offset(x: 0, y: 25)
                
            }
            }
        }
    }
}


struct VorhandeneBBuecherArray: View {

    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings.shared
    
    var body: some View {

        ScrollView(.vertical) {
            HStack {
                Spacer()
                VStack {
                    ForEach(self.globals.vorhandeneBBuecherArrayCache, id: \.id) { bbuch in
                        Button(action: {
                            self.checkAuswahl(bbuch: bbuch)
                        }) {
                            Text("\(bbuch.lang)\(self.globals.cheatNaechstesBB && self.globals.gewaehlteBBuecherArray.count + 1 == bbuch.reihenfolgeNr ? "." : "")")
                                .foregroundColor(self.globals.falschGewaehlteBBuecherArray.contains(bbuch) ? Color.init("Hintergrund") : Color.init(#colorLiteral(red: 0.5019999743, green: 0.5019999743, blue: 0.5019999743, alpha: 1)))
                                .font(.title)
                        }
                    }.padding(.bottom, 10)
                }
                Spacer()
            }
        }.frame(width: 250, height: 300)

    }
    
    
    func checkAuswahl(bbuch: Bibelbuch) {
        
        if self.globals.gewaehlteBBuecherArray.count + 1 == bbuch.reihenfolgeNr {
            self.richtigeAuswahl(bbuch: bbuch)
        } else {
            self.falscheAuswahl(bbuch: bbuch)
        }
        
    }
    
    
    // MARK: - RICHTIGE AUSWAHL
    func richtigeAuswahl(bbuch: Bibelbuch) {
        
        if self.settings.selectedSound == 1 {
            PlaySound(sound: "richtig", type: "mp3", volume: self.settings.selectedSoundVolume)
        }
        
        self.globals.punkte += self.globals.calculatePluspunkte()
        //self.globals.hilfePunkte += 50
        self.globals.gewaehlteBBuecherArray.append(bbuch)
        self.globals.vorhandeneBBuecherArray = self.globals.vorhandeneBBuecherArray.filter { $0.reihenfolgeNr != bbuch.reihenfolgeNr }
        self.globals.prepareCache()
        self.globals.hilfeAnzeigen = false
        self.globals.hilfeAuswaehlen(language: self.settings.language, hilfeArt: self.globals.hilfeArt)
        
        // Fortschritt berechnen
        if self.globals.bibelteil == 2 {
            self.globals.fortschritt = (self.globals.gewaehlteBBuecherArray.count - 39) * 100 / (self.globals.vorhandeneBBuecherArray.count + (self.globals.gewaehlteBBuecherArray.count - 39))
        } else  {
            self.globals.fortschritt = self.globals.gewaehlteBBuecherArray.count * 100 / (self.globals.vorhandeneBBuecherArray.count + self.globals.gewaehlteBBuecherArray.count)
        }
        
        // falsch gewählte Bücher wieder löschen
        self.globals.falschGewaehlteBBuecherArray.removeAll()
        
        // Spiel beendet?
        if self.globals.vorhandeneBBuecherArray.count == 0 {
            self.globals.spielEnde()
        }

    }
    
    
    // MARK: - FALSCHE AUSWAHL
    func falscheAuswahl(bbuch: Bibelbuch) {
        
        if self.settings.selectedSound == 1 {
            PlaySound(sound: "falsch2", type: "mp3", volume: self.settings.selectedSoundVolume)
        }
        
        self.globals.fehler += 1
        self.globals.punkte -= self.globals.calculateMinuspunkte()
        
        if self.globals.punkte < 0 {
            self.globals.punkte = 0
        }
        
        self.globals.falschGewaehlteBBuecherArray.append(bbuch)
        
    }
    

}

struct BibelbuecherAuswahlView_Previews: PreviewProvider {
    static var previews: some View {
        BibelbuecherAuswahlView()
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
