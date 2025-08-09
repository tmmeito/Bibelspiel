//
//  BalkenView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 12.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI


struct BalkenView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    let breite = CGFloat(310)
    let hoehe = CGFloat(15)
    let eckenRadius = CGFloat(4)
    var hoeheAnzeige = CGFloat(6)

    @State var txtBaustein: String = ""
    @State var timerInt = 0
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                // Balken und Umrandung
                RoundedRectangle(cornerRadius: self.eckenRadius, style: .circular)
                    .fill(Color("Hell"))
                    .frame(width: self.breite, height: self.hoehe, alignment: .center)
                    .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                    .overlay(RoundedRectangle(cornerRadius: self.eckenRadius).stroke(Color("Dunkel"), lineWidth: 1))
                
                
                // Text
                HStack(spacing: 4) {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: self.txtBaustein)):")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Color("Dunkel"))
                        .padding(.leading, 5)
                    
                    if self.txtBaustein == "fortschritt" {
                        
                    } else if self.txtBaustein == "zeit" {
                        TimerView(timerInt: self.$timerInt, referenceDate: self.globals.spielStartDatum)
                    }
                    
                    Spacer()
                }.frame(width: self.breite)
                .offset(y: -17)
                
                
                // Anzeigebalken
                HStack {
                    HStack {
                        Text("")
                    }.frame(width: self.txtBaustein == "fortschritt" ? self.globals.calculateBreiteAnzeigeFortschritt(breite: self.breite) : CalculateBreiteAnzeigeZeit(breite: self.breite, spielStartDatumInt: self.timerInt, spieldauerReferenz: self.globals.spieldauerReferenz()), height: self.hoeheAnzeige)
                    .background(Color("Dunkel"))
                    .overlay(RoundedRectangle(cornerRadius: self.eckenRadius + 3).stroke(Color("Dunkel"), lineWidth: 2))
                    .padding(.leading, 6)
                    
                    Spacer()
                }.frame(width: self.breite, height: self.hoeheAnzeige)
            }
        }
    }
}



struct BalkenView_Previews: PreviewProvider {
    static var previews: some View {
        BalkenView(txtBaustein: "zeit")
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
