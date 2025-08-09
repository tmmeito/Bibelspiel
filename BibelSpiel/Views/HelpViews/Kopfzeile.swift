//
//  Kopfzeile.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 04.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct Kopfzeile: View {
    
    @State var txtBaustein: String
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                
                Rectangle()
                    .path(in: CGRect(x: 0,
                                     y: 0,
                                     width: geometry.size.width,
                                     height: 2))
                    .fill(Color("Dunkel"))
                    .offset(y: geometry.size.height * 0.6)
                
                VStack {
                    HStack {
                        Button(action: {
                            
                            if self.settings.selectedSound == 1 {
                                PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                            }
                            
                            if self.globals.position == 5 {  // von Spiel
                                //self.globals.timerAktiv = false
                                self.globals.position = 6  // zu Spieleinstellungen
                            } else if self.globals.position == 3 {  // von Spielvorbereitungen
                                self.globals.position = 1  // zu Start
                            } else if self.globals.position == 2 { // von Einstellungen
                                self.globals.position = 1  // zu Start
                            } else if self.globals.position == 1 { // von Start
                                self.globals.position = 2  // zu Einstellungen
                            }
                            
                        }) {
                            Image("Logo")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.16)
                        }
                        Spacer()
                        
                        Text("\(TxtBaustein(language: self.settings.language, phrase: "\(self.txtBaustein)"))")
                            .font(.custom("Arial", size: 42))
                            //.font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("Dunkel"))
                            .padding(.bottom, 15)
                        
                        Spacer()
                    }
                }.padding()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}



struct Kopfzeile_Previews: PreviewProvider {
    static var previews: some View {
        Kopfzeile(txtBaustein: "willkommen")
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
