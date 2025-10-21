//
//  ScoreListView.swift
//  WKQatar
//
//  Created by Miro Six on 20/10/2025.
//
import SwiftUI

struct ScoreListView: View {
    @Binding var selectedTeam: String?
    @Binding var selectedLocation: String?
    @Binding var selectedWKResult: WKResult?
    @Environment(WKResultsDataStore.self) private var store

    var body: some View {
        if let selectedLocation = selectedLocation {
            VStack {
                List(store.getAllResultsByLocation(location: selectedLocation), id: \.self, selection: $selectedWKResult) { result in
                    Grid(alignment: .center, horizontalSpacing: 16, verticalSpacing: 4) {
                        GridRow {
                            Text(result.homeTeam)
                                .frame(maxWidth: .infinity, alignment: .center)

                            Text("vs")
                                .frame(maxWidth: .infinity, alignment: .center)

                            Text(result.awayTeam)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        if result.homeTeamScore != nil {
                            GridRow {
                                Text(result.homeTeamScore != nil ? String(result.homeTeamScore!) : "")
                                    .frame(maxWidth: .infinity, alignment: .center)

                                Text("-")
                                    .frame(maxWidth: .infinity, alignment: .center)

                                Text(result.awayTeamScore != nil ? String(result.awayTeamScore!) : "")
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                                                    
                        
                    }.frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
}
