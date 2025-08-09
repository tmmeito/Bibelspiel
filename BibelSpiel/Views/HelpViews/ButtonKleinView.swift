//
//  ButtonKleinView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 10.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct ButtonKleinView: View {
    
    @State var language: Int = 0
    @State var txtBaustein = ""
    @State var fontBold = false
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    var body: some View {
        
        VStack {
            Button(action: {
                if self.settings.selectedSound == 1 {
                    PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                }
                
                if self.globals.position == 2 { // von Einstellungen
                    self.globals.position = 1  // zu Start
                } else if self.globals.position == 3 { // von Spielvorbereitung
                    if self.txtBaustein == "einfach" {
                        self.globals.schwierigkeitsgrad = 1
                        self.globals.position = 5
                        self.globals.spielStart(settings: self.settings)
                        
                    } else if self.txtBaustein == "mittel" {
                        self.globals.schwierigkeitsgrad = 2
                        self.globals.position = 5
                        self.globals.spielStart(settings: self.settings)
                        
                    } else if self.txtBaustein == "schwer" {
                        self.globals.schwierigkeitsgrad = 3
                        self.globals.position = 5
                        self.globals.spielStart(settings: self.settings)
                    }
                } else if self.globals.position == 6 && self.txtBaustein != "spielende" { // von Spieleinstellungen
                    self.globals.position = 5  // zu Spiel
                } else if self.globals.position == 6 && self.txtBaustein == "spielende" { // von Spieleinstellungen
                    self.globals.position = 7  // zu Spiel beenden
                } else if self.globals.position == 8 {  // von Spielende
                    self.globals.position = 1  // zu Start
                }
                
            }) {
                
                Text("\(TxtBaustein(language: self.language, phrase: self.txtBaustein))")
                    .font(.title)
                    .fontWeight(self.fontBold ? .bold : .none)
                    .foregroundColor(Color("Hell"))
                    .frame(width: 250, height: 58)
                    .background(Color("Dunkel"))
                    .cornerRadius(20)
                    .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Hell"), lineWidth: 2))
                
            }
        }
    }
}


struct ButtonKleinView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonKleinView(language: 0, txtBaustein: "neuesSpiel", fontBold: true).environmentObject(Globals(language: 0))
    }
}
