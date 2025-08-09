//
//  SpielBeendenView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 17.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct SpielBeendenView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    let hoehe = CGFloat(310)
    let hoeheHintergrundUeberschrift = CGFloat(60)
    let breite = CGFloat(450)
    
    
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
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "spielBeenden").uppercased())")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("Hell"))
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                }.frame(width: self.breite, height: self.hoeheHintergrundUeberschrift, alignment: .center)
                    .background(Color("Dunkel"))
                    .offset(x: 0, y: -100)
            }
            
            // Fensterinhalt
            Text("\(TxtBaustein(language: self.settings.language, phrase: "spielBeendenTxt"))")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(Color("Dunkel"))
                .frame(width: 350)
            
            
            // Button
            HStack {
                ButtonVariabelView(txtBaustein: "nein", breite: 150, cornerRadius: 20, fontBold: true, uppercase: true)
                    .offset(y: 100)
                
                Spacer()
                
                ButtonVariabelView(txtBaustein: "ja", breite: 150, cornerRadius: 20, fontBold: false, uppercase: false)
                    .offset(y: 100)
            }.padding(.leading, 35)
            .padding(.trailing, 35)
            .frame(width: self.breite)
                
            
            if self.globals.position == 7 {
                //SpielBeendenView()
            }
        }
        
    }
}

struct SpielBeendenView_Previews: PreviewProvider {
    static var previews: some View {
        SpielBeendenView()
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
