//
//  EinstellungenSpielerView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 08.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct EinstellungenSpielerView: View {
    
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var globals: Globals
    @FetchRequest(entity: Spieler.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Spieler.name, ascending: true)]) var spieler: FetchedResults<Spieler>
    @ObservedObject var settings: Settings
    @State var neuerName = ""
    
    
    init(settings: Settings) {
        //UITableView.appearance().separatorStyle = .singleLine
        //UITableView.appearance().tintColor = UIColor.init(named: "Dunkel")
        //UITableViewCell.appearance().backgroundColor = UIColor.init(named: "Hell")
        //UITableView.appearance().backgroundColor = UIColor.init(named: "Hell")
        self.settings = settings
    }
    
    var body: some View {
        HStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    ForEach(self.spieler, id: \.self) { spielerN in
                        Button(action: {
                            if self.settings.selectedSound == 1 {
                                PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                            }
                            withAnimation(.none) {
                                self.settings.aktuellerSpielerName = spielerN.name!
                            }
                        }) {
                            Text(spielerN.name ?? "kein Name")
                                .font(.system(size: 22))
                                .foregroundColor(Color.init("Dunkel"))
                        }
                        .listRowBackground(Color.init("Hell"))
                        .padding(.bottom, 15)
                    }.onDelete(perform: removeSpieler)
                    
                }.frame(width: 160, height: 150)
                    //.environment(\.defaultMinListRowHeight, 5)
            }
            
            Spacer()
            
            VStack {
                Text("\(TxtBaustein(language: self.settings.language, phrase: "neuerSpieler")): ")
                    .foregroundColor(Color.init("Dunkel"))
                    .font(.system(size: 22))
                    .bold()
                
                ZStack {
                    TextField("\(TxtBaustein(language: self.settings.language, phrase: "neuerSpieler"))", text: $neuerName)
                        .foregroundColor(Color.init("Dunkel"))
                        .frame(width: 150)
                        .padding(.leading, 10).padding(.trailing, 10)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.init("Dunkel"), lineWidth: 1))
                    
                    VStack(alignment: .trailing) {
                        Button(action: {
                            if self.neuerName != "" {
                                
                                if self.settings.selectedSound == 1 {
                                    PlaySound(sound: "select", type: "mp3", volume: self.settings.selectedSoundVolume)
                                }
                                
                                if self.spieler.count > 0 {
                                    var vorhanden = 0
                                    for spielerName in self.spieler {
                                        if spielerName.name!.capitalized == self.neuerName.capitalized {
                                            // neu eingegebener Name schon vorhanden
                                            vorhanden += 1
                                            if self.settings.selectedSound == 1 {
                                                PlaySound(sound: "falsch", type: "mp3", volume: self.settings.selectedSoundVolume)
                                            }
                                        }
                                    }
                                    
                                    if vorhanden == 0 {
                                        let spieler = Spieler(context: self.moc)
                                        spieler.name = self.neuerName
                                        spieler.id = UUID()
                                        try! self.moc.save()
                                    }
                                    
                                } else {
                                    // neu eingegebener Name noch nicht vorhanden
                                    let spieler = Spieler(context: self.moc)
                                    spieler.name = self.neuerName
                                    spieler.id = UUID()
                                    try! self.moc.save()
                                }
                            } else {
                                if self.settings.selectedSound == 1 {
                                    PlaySound(sound: "falsch", type: "mp3", volume: self.settings.selectedSoundVolume)
                                }
                            }
                            self.neuerName = ""
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                                .foregroundColor(Color.init("Dunkel"))
                            
                        }.padding(.leading, 140)
                    }
                }
                Spacer()
            }.frame(width: 160, height: 150)
            Spacer()
        }.padding()
        .overlay(Rectangle().stroke(Color.init("Dunkel"), lineWidth: 1))
        
    }
    
    
    func removeSpieler(at offsets: IndexSet) {
        for index in offsets {
            let spielerN = spieler[index]
            moc.delete(spielerN)
            if spieler[index].name == self.settings.aktuellerSpielerName {
                self.settings.aktuellerSpielerName = " - "
            }
            try! moc.save()
        }
    }
    
}



struct EinstellungenSpielerView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return EinstellungenSpielerView(settings: Settings())
            .environment(\.managedObjectContext, context)
            .previewLayout(.fixed(width: 500, height: 320))
    }
}
