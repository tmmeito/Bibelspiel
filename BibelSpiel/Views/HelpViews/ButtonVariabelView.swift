//
//  ButtonVariabelView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 17.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct ButtonVariabelView: View {
    
    //@State var language: Int = 0
    @State var txtBaustein = ""
    @State var breite = CGFloat(200)
    @State var cornerRadius = CGFloat(20)
    @State var largeTitle = false
    @State var fontBold = false
    @State var uppercase = false
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    
    var body: some View {
        
        VStack {
            Button(action: {
                if self.settings.selectedSound == 1 {
                    PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                }
                if self.txtBaustein == "sprDeutsch" {
                    self.settings.language = 0
                } else if self.txtBaustein == "sprMazedonisch" {
                    self.settings.language = 1
                }
                
                self.globals.buttonActions(txtBaustein: self.txtBaustein)
            }) {
                
                Text("\(self.uppercase ? TxtBaustein(language: self.settings.language, phrase: self.txtBaustein).uppercased() : TxtBaustein(language: self.settings.language, phrase: self.txtBaustein))")
                    .font(self.largeTitle ? .largeTitle : .title)
                    .fontWeight(self.fontBold ? .bold : .none)
                    .foregroundColor(Color("Hell"))
                    .frame(width: self.breite, height: 58)
                    .background(Color("Dunkel"))
                    .cornerRadius(self.cornerRadius)
                    .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                    .overlay(RoundedRectangle(cornerRadius: self.cornerRadius).stroke(Color("Hell"), lineWidth: 2))
            }
        }
    }
}


struct ButtonVariabelView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonVariabelView(txtBaustein: "neuesSpiel", fontBold: true)
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
