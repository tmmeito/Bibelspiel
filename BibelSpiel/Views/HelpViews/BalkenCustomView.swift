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
    let hoehe = CGFloat(100)
    let eckenRadius = CGFloat(4)
    
    var wertAnzeigeReferenz = CGFloat(300)
    var wertAnzeigeSpieler = CGFloat(220)
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
                    Text("\(TxtBaustein(language: self.globals.language, phrase: "referenzzeit")): ")
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
                    Text("\(self.settings.aktuellerSpielerName)Tobias: ")
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
            }
        }
    }
}


struct BalkenCustomView_Previews: PreviewProvider {
    static var previews: some View {
        SpielEndeBalkenView()
            .environmentObject(Globals(language: 1))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
