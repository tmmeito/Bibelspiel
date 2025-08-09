//
//  FortschrittHighscoreView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 19.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct FortschrittHighscoreView: View {
    
    @Binding var gefiltert: [Fortschritt]
    
    @ObservedObject var settings = Settings()
    @EnvironmentObject var globals: Globals
    
    init(gefiltert: Binding<[Fortschritt]>) {
        self._gefiltert = gefiltert
        UITableView.appearance().separatorStyle = .singleLine
        UITableView.appearance().tintColor = UIColor.init(named: "Dunkel")
        UITableViewCell.appearance().backgroundColor = UIColor.init(named: "Hell")
        UITableView.appearance().backgroundColor = UIColor.init(named: "Hell")
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack() {
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "name"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "punkte"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "fehler"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "zeit"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "bibelteil"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "schwierigkeit"))")
                    .bold()
                }.frame(width: 75)
                VStack {
                    Text("\(TxtBaustein(language: self.settings.language, phrase: "hilfe"))")
                    .bold()
                }.frame(width: 75)
                
            }.foregroundColor(Color.init("Dunkel"))
                .padding(.leading, 10)
                .padding(.trailing, 10)
            
            Divider()
            
            List() {
                ForEach(self.gefiltert, id: \.self) { gespeicherterFortschritt in
                    HStack {
                        VStack {
                            Text("\(gespeicherterFortschritt.spieler?.name ?? "-")")
                        }.frame(width: 75)
                        VStack {
                            Text("\(gespeicherterFortschritt.punkte)")
                        }.frame(width: 75)
                        VStack {
                            Text("\(gespeicherterFortschritt.fehler)")
                        }.frame(width: 75)
                        VStack {
                            Text("\(self.globals.zeitString(sekundenInt: Int(gespeicherterFortschritt.spieldauer)))")
                        }.frame(width: 75)
                        VStack {
                            Text("\(gespeicherterFortschritt.bibelteil)")
                        }.frame(width: 75)
                        VStack {
                            Text("\(gespeicherterFortschritt.schwierigkeitsgrad)")
                        }.frame(width: 75)
                        VStack {
                            Text("\(gespeicherterFortschritt.hilfeVerwandt)")
                        }.frame(width: 75)
                    }.foregroundColor(Color.init("Dunkel"))
                }
            }.environment(\.defaultMinListRowHeight, 4)
                .offset(x: -5)
        }.padding()
        .overlay(Rectangle().stroke(Color.init("Dunkel"), lineWidth: 1))
    }
}
