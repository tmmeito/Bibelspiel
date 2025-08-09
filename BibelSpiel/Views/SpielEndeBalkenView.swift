//
//  BalkenCustomView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 15.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct SpielEndeBalkenView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    let breite = CGFloat(316)
    let breiteBalken = CGFloat(300)
    let hoehe = CGFloat(100)
    let eckenRadius = CGFloat(4)
    
    @State var wertAnzeigeReferenz = CGFloat(0)
    @State var wertAnzeigeSpieler = CGFloat(0)
    var hoeheAnzeige = CGFloat(6)
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                // Balken und Umrandung
                RoundedRectangle(cornerRadius: self.eckenRadius, style: .circular)
                    .fill(Color("Hell"))
                    .frame(width: self.breite, height: self.hoehe, alignment: .center)
                    .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                    .overlay(RoundedRectangle(cornerRadius: self.eckenRadius).stroke(Color("Dunkel"), lineWidth: 1))
                
                
                // Anzeige Referenz
                HStack(spacing: 4) {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "referenzzeit")): \(self.globals.zeitString(sekundenInt: self.globals.spieldauerReferenz()))")
                        .font(.body)
                        .bold()
                        .foregroundColor(Color("Dunkel"))
                        .padding(.leading, 5)
                    
                    Spacer()
                }.frame(width: self.breite)
                .offset(y: -35)
                
                
                HStack {
                    HStack {
                        Text("")
                    }.frame(width: self.wertAnzeigeReferenz, height: self.hoeheAnzeige)
                    .background(Color("Dunkel"))
                    .overlay(RoundedRectangle(cornerRadius: self.eckenRadius + 3).stroke(Color("Dunkel"), lineWidth: 2))
                    .padding(.leading, 6)
                    
                    Spacer()
                }.frame(width: self.breite, height: self.hoeheAnzeige)
                    .offset(y: -15)
                
                
                // Anzeige Spieler
                HStack(spacing: 4) {
                    Text("\(self.settings.aktuellerSpielerName): \(self.globals.zeitString(sekundenInt: self.globals.spielStartDatumInt))")
                        .font(.body)
                        .bold()
                        .foregroundColor(Color("Dunkel"))
                        .padding(.leading, 5)
                    
                    Spacer()
                }.frame(width: self.breite)
                .offset(y: 15)
  
                
                HStack {
                    HStack {
                        Text("")
                    }.frame(width: self.wertAnzeigeSpieler, height: self.hoeheAnzeige)
                        .background(Color("Dunkel"))
                        .overlay(RoundedRectangle(cornerRadius: self.eckenRadius + 3).stroke(Color("Dunkel"), lineWidth: 2))
                        .padding(.leading, 6)
                    
                    Spacer()
                }.frame(width: self.breite, height: self.hoeheAnzeige)
                   .offset(y: 35)
            }.onAppear() {
                self.wertAnzeigeReferenz = self.balkenBreiteBerechnen(balken: 1)
                self.wertAnzeigeSpieler = self.balkenBreiteBerechnen(balken: 2)
            }
        }
    }
    
    
    func balkenBreiteBerechnen(balken: Int) -> CGFloat {
        
        var balkenBreiteInt = CGFloat(0)
        var valueProzentReferenzInt = 0
        var valueProzentSpielerInt = 0
        let referenzInt = self.globals.spieldauerReferenz()
        let spielerInt = self.globals.spielStartDatumInt
        
        if referenzInt >= spielerInt {
            valueProzentReferenzInt = 100
            valueProzentSpielerInt = spielerInt * 100 / referenzInt
            
        } else {
            valueProzentSpielerInt = 100
            valueProzentReferenzInt = referenzInt * 100 / spielerInt
        }
        
        if balken == 1 { // Referenzbalken
            balkenBreiteInt = self.breiteBalken * CGFloat(valueProzentReferenzInt) / 100
        } else if balken == 2 {  // Spielerbalken
            balkenBreiteInt = self.breiteBalken * CGFloat(valueProzentSpielerInt) / 100
        }
        
        return balkenBreiteInt
    }
    
}

