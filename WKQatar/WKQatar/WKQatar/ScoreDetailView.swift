//
//  ScoreDetailView.swift
//  WKQatar
//
//  Created by Miro Six on 20/10/2025.
//

import SwiftUI

struct ScoreDetailView: View {
    @Binding var selectedWKResult: WKResult?
    var body: some View {
        if let selectedWKResult = selectedWKResult {
            Text(selectedWKResult.dateUTC)
            Text(selectedWKResult.location)
            Grid(alignment: .center, horizontalSpacing: 16, verticalSpacing: 4) {
                GridRow {
                    Text(selectedWKResult.homeTeam)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text("vs")
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text(selectedWKResult.awayTeam)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                if selectedWKResult.homeTeamScore != nil {
                    GridRow {
                        Text(selectedWKResult.homeTeamScore != nil ? String(selectedWKResult.homeTeamScore!) : "")
                            .frame(maxWidth: .infinity, alignment: .center)

                        Text("-")
                            .frame(maxWidth: .infinity, alignment: .center)

                        Text(selectedWKResult.awayTeamScore != nil ? String(selectedWKResult.awayTeamScore!) : "")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                                            
                
            }.frame(maxWidth: .infinity, alignment: .center)
            
            Text("Round: \(selectedWKResult.roundNumber)")
            Text("Group:" + String(selectedWKResult.group))
        }
    }
}

