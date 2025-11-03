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
            
            Text(selectedWKResult.dateUTC).frame(maxWidth: .infinity, alignment: .leading).padding(10).fontWeight(.semibold)
            Spacer()
            Text(selectedWKResult.location).frame(maxWidth: .infinity, alignment: .center).font(.title)
            Spacer()
            Divider()
            Grid(alignment: .center, horizontalSpacing: 16, verticalSpacing: 4) {
                GridRow {
                    Text(selectedWKResult.homeTeam)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text("X")
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
                                            
                
            }.frame(maxWidth: .infinity, alignment: .center).padding(2)
            Divider()
            Spacer()
            Text("Round: \(selectedWKResult.roundNumber)").frame(maxWidth: .infinity, alignment: .leading).padding(10)
            Spacer()
            Text("Group:" + String(selectedWKResult.group!)).frame(maxWidth: .infinity, alignment: .leading).padding(10)
            Spacer()
        }
    }
}

