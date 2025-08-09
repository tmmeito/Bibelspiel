//
//  StatusbarView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 12.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct StatusbarView: View {
    
    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings()
    
    let breite = CGFloat(0.26)
    let hoehe = CGFloat(0.09)
    let eckenRadius = CGFloat(10)
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                // Hintergrund und Umrandung  w:235
                RoundedRectangle(cornerRadius: self.eckenRadius, style: .circular)
                    .fill(Color("Hell"))
                    .frame(width: geometry.size.width * self.breite, height: geometry.size.height * self.hoehe, alignment: .center)
                    .shadow(color: Color("Schatten"), radius: 5, x: 5, y: 5)
                    .overlay(RoundedRectangle(cornerRadius: self.eckenRadius).stroke(Color("Dunkel"), lineWidth: 4))
                
                // Infoleiste mit Beschriftung
                ZStack() {
                    ZStack {
                        HStack {
                            Text("\(TxtBaustein(language: self.settings.language, phrase: "punkte").uppercased())")
                                .font(.body)
                                .bold()
                                .foregroundColor(Color("Hell"))
                        }.offset(x: -(geometry.size.width * self.breite) / 4, y: -(geometry.size.height * 0))
                        
                        HStack {
                            Text("\(TxtBaustein(language: self.settings.language, phrase: "fehler").uppercased())")
                                .font(.body)
                                .bold()
                                .foregroundColor(Color("Hell"))
                            
                        }.offset(x: (geometry.size.width * self.breite) / 4, y: -(geometry.size.height * 0))
                    }.frame(width: geometry.size.width * self.breite, height: 18)
                    .background(Color("Dunkel"))
                    .offset(x: 0, y: -(geometry.size.height * 0.022))
                
                // Zahlen
                    ZStack {
                        HStack {
                            Text("\(self.globals.punkte)")
                                .font(.largeTitle)
                                .foregroundColor(Color("Dunkel"))
                        }.offset(x: -(geometry.size.width * self.breite) / 4, y: -(geometry.size.height * -0.016))
                        
                        HStack {
                            Text(String(self.globals.fehler))
                                .font(.largeTitle)
                                .foregroundColor(Color("Dunkel"))
                        }.offset(x: (geometry.size.width * self.breite) / 4, y: -(geometry.size.height * -0.016))
                    }
                }
            }
        }
    }
}

struct StatusbarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusbarView()
            .environmentObject(Globals(language: 0))
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
