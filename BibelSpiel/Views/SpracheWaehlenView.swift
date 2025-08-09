//
//  SpracheWaehlenView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 25.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct SpracheWaehlenView: View {
    
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
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "spracheWaehlen").uppercased())")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("Hell"))
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                }.frame(width: self.breite, height: self.hoeheHintergrundUeberschrift, alignment: .center)
                    .background(Color("Dunkel"))
                    .offset(x: 0, y: -100)
            }
            
            
            // Button
            VStack {
                ButtonVariabelView(txtBaustein: "sprDeutsch", breite: 250, cornerRadius: 10, fontBold: true, uppercase: true)
                    .offset(y: 40)
                
                Spacer()
                
                ButtonVariabelView(txtBaustein: "sprMazedonisch", breite: 250, cornerRadius: 10, fontBold: true, uppercase: true)
                    .offset(y: 40)
            }.frame(width: self.breite, height: self.hoehe / 2)
        }
    }
}

struct SpracheWaehlenView_Previews: PreviewProvider {
    static var previews: some View {
        SpracheWaehlenView()
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
