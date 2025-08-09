//
//  SpielEndeBonusView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 22.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct SpielEndeBonusView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    let breite = CGFloat(160)
    let breiteBalken = CGFloat(300)
    let hoehe = CGFloat(100)
    let eckenRadius = CGFloat(4)
    
    @Binding var anzeigeId: Int  // 1: punkte  2: bonus  3: gesamt
    
    var body: some View {
        
        ZStack {
            // Balken und Umrandung
            RoundedRectangle(cornerRadius: self.eckenRadius, style: .circular)
                .fill(Color("Hell"))
                .frame(width: self.breite, height: self.hoehe, alignment: .center)
                .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                .overlay(RoundedRectangle(cornerRadius: self.eckenRadius).stroke(Color("Dunkel"), lineWidth: 1))
            
            
            // Anzeige Referenz
            HStack(spacing: 4) {
                Spacer()
                Text("\(self.ueberschriftTxt())")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color("Dunkel"))
                    .padding(.top, 30)
                Spacer()
            }.frame(width: self.breite)
                .offset(y: -30)
            
            Text("\(self.punkteTxt())")
                .font(.title)
                .bold()
                .foregroundColor(Color("Dunkel"))
                .offset(y: 15)
        }
    }
    
    
    func ueberschriftTxt() -> String {
        
        var strg = ""
        
        if self.anzeigeId == 1 {
            
            strg = "\(TxtBaustein(language: self.settings.language, phrase: "punkte").uppercased())"
            
        } else if self.anzeigeId == 2 {
            
            strg = "\(TxtBaustein(language: self.settings.language, phrase: "zeitbonus").uppercased())"
            
        } else if self.anzeigeId == 3 {
            
            strg = "\(TxtBaustein(language: self.settings.language, phrase: "gesamt").uppercased())"
            
        }
        
        return strg
    }
    
    
    
    func punkteTxt() -> String {
        
        var strg = ""
        
        if self.anzeigeId == 1 {
            
            strg = "\(self.globals.punkteCache.formattedWithSeparator)"
            
        } else if self.anzeigeId == 2 {
            
            if self.globals.punkte > self.globals.punkteCache {
                strg = "+\((self.globals.punkte - self.globals.punkteCache).formattedWithSeparator)"
            } else {
                strg = "-"
            }
            
        } else if self.anzeigeId == 3 {
            strg = "\(self.globals.punkte.formattedWithSeparator)"
        }
        
        return strg
    }
}



struct SpielEndeBonusView_Previews: PreviewProvider {
    static var previews: some View {
        SpielEndeBonusView(anzeigeId: .constant(1))
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
