//
//  SchwierigkeitsstufenView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 10.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct SpielvorbereitungenView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                Color.init("Hintergrund")
                
                VStack {
                    Kopfzeile(txtBaustein: "spielvorbereitungen")
                        .frame(height: geo.size.height * 0.21)
                    
                    Auswaehlen()
                        .frame(height: geo.size.height * 0.20)
                        .padding(.top, geo.size.height / 15)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        VStack(spacing: 20) {
                            ButtonKleinView(language: self.settings.language, txtBaustein: "einfach", fontBold: true)
                            
                            Text("\(TxtBaustein(language: self.settings.language, phrase: "schwierigkeitsgradTxt_1"))")
                            + Text("\(TxtBaustein(language: self.settings.language, phrase: "drei"))")
                                .fontWeight(.heavy)
                            + Text("\(TxtBaustein(language: self.settings.language, phrase: "schwierigkeitsgradTxt_2"))")
                        }.frame(width: 250)
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                        .foregroundColor(Color("Dunkel"))
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            ButtonKleinView(language: self.settings.language, txtBaustein: "mittel", fontBold: true)
                            Text("\(TxtBaustein(language: self.settings.language, phrase: "schwierigkeitsgradTxt_1"))")
                            + Text("\(TxtBaustein(language: self.settings.language, phrase: "sieben"))")
                                .fontWeight(.heavy)
                            + Text("\(TxtBaustein(language: self.settings.language, phrase: "schwierigkeitsgradTxt_2"))")
                        }.frame(width: 250)
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                        .foregroundColor(Color("Dunkel"))
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            ButtonKleinView(language: self.settings.language, txtBaustein: "schwer", fontBold: true)
                            Text("\(TxtBaustein(language: self.settings.language, phrase: "schwierigkeitsgradTxt_1"))")
                            + Text("\(TxtBaustein(language: self.settings.language, phrase: "alle"))")
                                .fontWeight(.heavy)
                            + Text("\(TxtBaustein(language: self.settings.language, phrase: "schwierigkeitsgradTxt_2"))")
                        }.frame(width: 250)
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                        .foregroundColor(Color("Dunkel"))
                        
                        Spacer()
                    }.padding(.bottom, 15)
                    
                    //Spacer()
                    
                    Fusszeile()
                        .frame(height: geo.size.height * 0.065)
                        .padding(.bottom, geo.size.height * 0.045)
                    
                }.padding(.top, 35)
                
                
            }.edgesIgnoringSafeArea(.all)
        }
    }
    
}


struct Auswaehlen: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    var body: some View {
        
        ZStack {
            Color.init("Hell")
            
            HStack {
                Text("\(TxtBaustein(language: self.settings.language, phrase: "waehleSchwierigkeitsgrad"))\(self.globals.cheatReihenfolgeBB ? ":" : "")")
                    .font(.custom("Arial", size: 42))
                    .foregroundColor(Color("Dunkel"))
                    .fontWeight(.bold)
                    .onTapGesture(count: 2) {
                        self.globals.cheatReihenfolgeBB.toggle()
                    }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 15) {
                    Button(action: {
                        if self.settings.selectedSound == 1 {
                            PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                        }
                        self.globals.bibelteil = 1
                    }) {
                    HStack(spacing: 10) {
                        Option(bibelteilGewaehlt: 1)
                        Text("\(TxtBaustein(language: self.settings.language, phrase: "hebraeischeSchriften"))")
                            .fontWeight(.black)
                        }}
                    
                    Button(action: {
                        if self.settings.selectedSound == 1 {
                            PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                        }
                        self.globals.bibelteil = 2
                    }) {
                    HStack(spacing: 10) {
                        Option(bibelteilGewaehlt: 2)
                        Text("\(TxtBaustein(language: self.settings.language, phrase: "christlichGriechischeSchriften"))")
                            .fontWeight(.black)
                        }}
                    
                    Button(action: {
                        if self.settings.selectedSound == 1 {
                            PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                        }
                        self.globals.bibelteil = 3
                    }) {
                    HStack(spacing: 10) {
                        Option(bibelteilGewaehlt: 3)
                        Text("\(TxtBaustein(language: self.settings.language, phrase: "kompletteBibel"))")
                            .fontWeight(.black)
                        }}
                }.foregroundColor(Color("Dunkel"))
                    .padding(.leading, 35)
                
            }.padding(.leading, 35).padding(.trailing, 35)
        }
    }
}


struct Option: View {
    
    @EnvironmentObject var globals: Globals
    var bibelteilGewaehlt = 0
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(Color.init(#colorLiteral(red: 0.5019999743, green: 0.5019999743, blue: 0.5019999743, alpha: 1)))
                .frame(width: 20, height: 20)
                .shadow(color: Color("Schatten"), radius: 5, x: 3, y: 3)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Hell"), lineWidth: 1))
            
            if self.globals.bibelteil == self.bibelteilGewaehlt {
                Circle()
                    .fill(Color.init(#colorLiteral(red: 0.9219999909, green: 0.9219999909, blue: 0.9219999909, alpha: 1)))
                    .frame(width: 12, height: 12)
            }
            
        }
        
    }
}



struct SchwierigkeitsstufenView_Previews: PreviewProvider {
    static var previews: some View {
        SpielvorbereitungenView().environmentObject(Globals(language: 0))
        .previewLayout(.fixed(width: 1024, height: 768))
    }
}
