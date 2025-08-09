//
//  WillkommenView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 25.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct WillkommenView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    let hoehe = CGFloat(545)
    let hoeheHintergrundUeberschrift = CGFloat(60)
    let breite = CGFloat(625)
    
    @State var showHighscore = false
    @State var bibelteilInt = 0
    @State var schwierigkeitsgradInt = 0
    
    @State var txtBausteinInhalt = "anleitungStart"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.init(named: "Dunkel")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.init(named: "Hell") as Any], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.init(named: "Dunkel") as Any], for: .normal)
    }
    
    
    var body: some View {
        
        ZStack {
            Color.init("HintergrundTransparent")
                .edgesIgnoringSafeArea(.all)
            
            // MARK: Fenster
            RoundedRectangle(cornerRadius: 20, style: .circular)
                .fill(Color("Hell"))
                .frame(width: self.breite, height: self.hoehe, alignment: .center)
                .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Dunkel"), lineWidth: 4))
            
            
            // MARK: Überschrift Text und Hintergrund
            ZStack() {
                HStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "anleitung").uppercased())")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("Hell"))
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                }.frame(width: self.breite, height: self.hoeheHintergrundUeberschrift, alignment: .center)
                    .background(Color("Dunkel"))
                    .offset(x: 0, y: -220)
            }
            
            
            // MARK: Fensterinhalt
            Text("\(TxtBaustein(language: self.settings.language, phrase: self.txtBausteinInhalt))")
                .font(.system(size: 23))
                .foregroundColor(Color("Dunkel"))
                .frame(width: 500)
             
            
            
            // MARK: Button
            HStack {
                ButtonVariabelView(txtBaustein: "weiter", breite: 200, fontBold: true, uppercase: true)
                    .offset(y: 220)
                    .padding()
            }
            
        }
    }
}

struct WillkommenView_Previews: PreviewProvider {
    static var previews: some View {
        WillkommenView()
    }
}
