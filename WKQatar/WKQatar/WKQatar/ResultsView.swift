//
//  ResultsView.swift
//  WKQatar
//
//  Created by Miro Six on 20/10/2025.
//

import SwiftUI

struct ResultsView: View {
    @Binding var selectedTeam: String?
    @State var selectedLocation: String? = nil
    @State var selectedWKResult: WKResult? = nil
    var body: some View {
        NavigationSplitView {
            ListStadionView(selectedLocation: $selectedLocation)
        } content: {
            ScoreListView(selectedTeam: $selectedTeam, selectedLocation: $selectedLocation, selectedWKResult: $selectedWKResult)
        }
        detail: {
            DetailGameView(selectedWKResult: $selectedWKResult)
        }
        
    }
}
