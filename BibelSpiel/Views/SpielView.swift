//
//  SpielView.swift
//  BibelSpiel
//
//  Created by Tobias Meisinger on 11.04.20.
//  Copyright © 2020 meitosoft. All rights reserved.
//

import SwiftUI

struct SpielView: View {

    @EnvironmentObject var globals: Globals
    @ObservedObject var settings = Settings.shared

    private var hilfeText: String {
        if globals.hilfeVorhanden {
            return "\(TxtBaustein(language: settings.language, phrase: "hilfeAnzeigenTxt_1")) \(globals.hilfePunkte) \(TxtBaustein(language: settings.language, phrase: "hilfeAnzeigenTxt_2")) \(settings.language == 0 ? TxtBaustein(language: settings.language, phrase: "hilfeAnzeigenTxt_3") : "")\(globals.cheatHilfe ? "." : "")"
        } else {
            return "\(TxtBaustein(language: settings.language, phrase: "hilfeAnzeigenTxt_keine"))"
        }
    }

    var body: some View {

        GeometryReader { geometry in
            let size = geometry.size

            ZStack {
                Color.init("Hintergrund")

                VStack(spacing: 0) {
                    Kopfzeile(txtBaustein: "reihenfolgeBibelbuecher")
                        .frame(height: size.height * 0.21)

                    Spacer()

                    HStack(alignment: .top, spacing: size.width * 0.05) {
                        SpielFortschrittView()
                            .frame(width: size.width * 0.65, height: size.height * 0.5)

                        BibelbuecherAuswahlView()
                            .frame(width: size.width * 0.26, height: size.height * 0.5)
                    }

                    Spacer()

                    HStack(spacing: 20) {
                        HilfeView()

                        VStack(alignment: .leading, spacing: -3) {
                            Text(hilfeText)
                                .font(.title)
                                .bold()
                                .lineLimit(2)
                                .foregroundColor(Color("Dunkel"))
                                .allowsTightening(true)
                                .minimumScaleFactor(0.7)
                        }
                        .frame(width: size.width * 0.28, height: size.height * 0.23, alignment: .leading)

                        Spacer()

                        VStack(spacing: size.height * 0.02) {
                            StatusbarView()

                            HStack(spacing: size.width * 0.02) {
                                BalkenView(txtBaustein: "zeit")
                                BalkenView(txtBaustein: "fortschritt")
                            }
                        }
                        .frame(width: size.width * 0.3)
                    }
                    .frame(height: size.height * 0.23)

                    Fusszeile()
                        .frame(height: size.height * (globals.hilfeAnzeigen ? 0.091 : 0.007))
                }
                .padding(.top, 35)
                .padding(.horizontal, size.width * 0.05)

                switch self.globals.position {
                case 8:
                    SpielEndeView(bibelteil: self.globals.bibelteil, schwierigkeitsgrad: self.globals.schwierigkeitsgrad)
                case 6, 7:
                   SpielEinstellungenView()
                default:
                    EmptyView()
                }
            }
            .frame(width: size.width, height: size.height)
        }
    }
}


struct SpielView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        return SpielView()
            .environmentObject(Globals(language: 0))
            .environment(\.managedObjectContext, context)
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}

