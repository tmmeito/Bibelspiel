//
//  LogoView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 04.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct LogoView: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("BIBEL")
            .tracking(1)
                .font(.custom("EuphemiaCAS", size: 44))
                .fontWeight(.bold)
                .bold()
                .foregroundColor(Color("Hell"))
            HStack(spacing: 4) {
                Image("Bibel")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
                    .foregroundColor(Color("Dunkel"))
                Text("SPIEL")
                    .font(.title)
                .foregroundColor(Color("Hell"))
            }
        }.padding(.top, 10).padding(.bottom, 10).padding(.leading, 15).padding(.trailing, 15)
        .background(Color("Dunkel"))
        .cornerRadius(25)
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color("Hell"), lineWidth: 3))
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
        .frame(width: 180, height: 125)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
