//
//  SpielFortschrittView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct SpielFortschrittView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings.shared
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                // Hintergrund und Umrandung  w: 667
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .fill(Color("Hell"))
                    .frame(width: geometry.size.width * 0.65, height: geometry.size.height * 0.5, alignment: .center)
                    .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Dunkel"), lineWidth: 4))
                
                // Infoleiste mit Beschriftung
                ZStack() {
                    HStack {
                        Text("\(TxtBaustein(language: self.settings.language, phrase: "fortschritt"))")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color("Hell"))
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                    }.frame(width: geometry.size.width * 0.65, height: (geometry.size.height * 0.4) * 0.11, alignment: .center)
                        .background(Color("Dunkel"))
                        .offset(x: 0, y: -(geometry.size.height * 0.2))
                    
                // Bibelbücher
                    HStack(spacing: (geometry.size.width * 0.65 - 2 * 245) / 3) {
                        HebraeischeSchriften()
                        CGriechischeSchriften()
                    }.position(x: (geometry.size.width * 0.65) / 1.3, y: geometry.size.height * 0.5 + (geometry.size.height * 0.4) * 0.08)
                }
            }
        }
    }
}


struct HebraeischeSchriften: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings.shared
    @State var bbuecherArray = [Bibelbuch]()
    
    var body: some View {
        
        HStack {

            VStack(spacing: 0) {
                HStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "hebraeischeSchriften"))")
                        .font(.custom("Arial", size: 20))
                        .bold()
                        .multilineTextAlignment(.center)
                }.frame(width: 190, height: 60)
                
                VStack(spacing: 5) {
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr <= 5 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 5 && $0.reihenfolgeNr <= 10 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 10 && $0.reihenfolgeNr <= 15 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 15 && $0.reihenfolgeNr <= 20 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 20 && $0.reihenfolgeNr <= 25 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 25 && $0.reihenfolgeNr <= 30 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 30 && $0.reihenfolgeNr <= 35 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 35 && $0.reihenfolgeNr <= 39 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                        Spacer()
                    }
                    Spacer()
                }.frame(width: 270, height: 250)
                    
            }
            .foregroundColor(self.globals.bibelteil != 2 ? Color.init("Dunkel") : Color.init("Hintergrund"))
            
        }.onAppear() {
            self.bbuecherArray = BBuecherArray(spracheID: self.settings.language)
        }
    }
}


struct CGriechischeSchriften: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings.shared
    @State var bbuecherArray = [Bibelbuch]()
    
    var body: some View {
        
        HStack {
            
            VStack(spacing: 0) {
                HStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "christlichGriechischeSchriften"))")
                        .font(.custom("Arial", size: 20))
                        .bold()
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                }.frame(width: 245, height: 60)
                
                VStack(spacing: 5) {
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 39 && $0.reihenfolgeNr <= 44 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 44 && $0.reihenfolgeNr <= 49 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 49 && $0.reihenfolgeNr <= 54 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 54 && $0.reihenfolgeNr <= 59 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 59 && $0.reihenfolgeNr <= 64 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                    }
                    HStack(spacing: 5) {
                        ForEach(bbuecherArray.filter { $0.reihenfolgeNr > 64 && $0.reihenfolgeNr <= 66 }, id: \.id) { bbuch in
                            BbuchFeld(bbuch: bbuch)
                        }
                        Spacer()
                    }
                    Spacer()
                }.frame(width: 270, height: 250)
                
            }.foregroundColor(self.globals.bibelteil != 1 ? Color.init("Dunkel") : Color.init("Hintergrund"))
            
        }.onAppear() {
            self.bbuecherArray = BBuecherArray(spracheID: self.settings.language)
        }
    }
}


struct BbuchFeld: View {
    
    @EnvironmentObject var globals: Globals
    @State var bbuch = Bibelbuch()
    
    var body: some View {
        
        ZStack {
            
            if self.globals.bibelteil == 1 {
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: 50, height: 25)
                    .foregroundColor(bbuch.reihenfolgeNr <= 39 && self.globals.gewaehlteBBuecherArray.count >= bbuch.reihenfolgeNr ? Color("Dunkel") : Color("Hintergrund"))
                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.globals.gewaehlteBBuecherArray.count >= bbuch.reihenfolgeNr ? Color("Hintergrund") : Color("Dunkel"), lineWidth: 1))
                Text(self.globals.gewaehlteBBuecherArray.count >= bbuch.reihenfolgeNr || self.bbuch.reihenfolgeNr > 39 ? bbuch.kurz : "?")
                    .foregroundColor(Color("Hell"))
                
            } else if self.globals.bibelteil == 2 {
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: 50, height: 25)
                    .foregroundColor(bbuch.reihenfolgeNr > 39 && self.globals.gewaehlteBBuecherArray.count >= bbuch.reihenfolgeNr ? Color("Dunkel") : Color("Hintergrund"))
                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(bbuch.reihenfolgeNr > 39 && self.globals.gewaehlteBBuecherArray.count >= bbuch.reihenfolgeNr ? Color("Hintergrund") : Color("Dunkel"), lineWidth: 1))
                Text(self.globals.gewaehlteBBuecherArray.count >= bbuch.reihenfolgeNr ? bbuch.kurz : "?")
                    .foregroundColor(Color("Hell"))
                
            } else if self.globals.bibelteil == 3 {
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: 50, height: 25)
                    .foregroundColor(self.globals.gewaehlteBBuecherArray.count >= bbuch.reihenfolgeNr ? Color("Dunkel") : Color("Hintergrund"))
                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.globals.gewaehlteBBuecherArray.count >= bbuch.reihenfolgeNr ? Color("Hintergrund") : Color("Dunkel"), lineWidth: 1))
                Text(self.globals.gewaehlteBBuecherArray.count >= bbuch.reihenfolgeNr ? bbuch.kurz : "?")
                    .foregroundColor(Color("Hell"))
            }
            
        }
    }
    
    
}


struct SpielFortschrittView_Previews: PreviewProvider {
    static var previews: some View {
        SpielFortschrittView()
        //BbuchFeld(bbuch: Bibelbuch())
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
