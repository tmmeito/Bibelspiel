//
//  ButtonView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 05.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct ButtonGrossView: View {
    
    //@State var language: Int = 0
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
                
                if self.txtBaustein == "neuesSpiel" {
                    withAnimation(.easeInOut(duration: 1)) {
                        self.globals.position = 3  // Spielvorbereitungen
                    }
                }
            }) {
                
                Text("\(TxtBaustein(language: self.settings.language, phrase: self.txtBaustein))")
                    .font(.largeTitle)
                    .fontWeight(self.fontBold ? .bold : .none)
                    .foregroundColor(Color("Hell"))
                    .frame(width: 310, height: 58)
                    .background(Color("Dunkel"))
                    .cornerRadius(20)
                    .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Hell"), lineWidth: 2))
                    
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGrossView(txtBaustein: "neuesSpiel", fontBold: true).environmentObject(Globals(language: 1))
    }
}
