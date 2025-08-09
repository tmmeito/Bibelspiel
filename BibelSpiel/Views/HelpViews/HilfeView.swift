//
//  HilfeView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 13.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct HilfeView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    var body: some View {
        
        Button(action: {
            if self.settings.selectedSound == 1 {
                PlaySound(sound: "help", type: "mp3", volume: self.settings.selectedSoundVolume)
            }
            if !self.globals.cheatHilfe {
                self.globals.punkte -= self.globals.hilfePunkte
                self.globals.hilfeVerwandt += 1
            }
            self.globals.hilfeAuswaehlen(language: self.settings.language, hilfeArt: self.globals.hilfeArt)
            self.globals.hilfeAnzeigen = true
        }) {
            ZStack {
                Circle()
                    .fill(Color.init("Dunkel"))
                    .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                    .overlay(
                        Circle()
                            .stroke(Color.init("Hell"), lineWidth: 2)
                ).frame(width: 60, height: 60)
                
                Image(systemName: "lightbulb")
                    .foregroundColor(Color("Hell"))
                    .font(.title)
            }
        }.disabled(self.globals.cheatHilfe ? false : self.globals.punkte - self.globals.hilfePunkte >= 0 && self.globals.hilfeVorhanden && self.globals.hilfeAnzeigen == false ? false : true)
        .opacity(self.globals.punkte - self.globals.hilfePunkte >= 0 && self.globals.hilfeVorhanden && self.globals.hilfeAnzeigen == false ? 1 : 0.5)
    }
    
}


struct HilfeView_Previews: PreviewProvider {
    static var previews: some View {
        HilfeView()
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
