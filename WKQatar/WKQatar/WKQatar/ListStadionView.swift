//
//  ListStadionView.swift
//  WKQatar
//
//  Created by Miro Six on 20/10/2025.
//

import SwiftUI

struct ListStadionView: View {
    @Environment(WKResultsDataStore.self) private var store
    @Binding var selectedLocation: String?
    var body: some View {
        List(store.getAllLocations(), id: \.self, selection: $selectedLocation) { location in
            Text(location)
        }
        .navigationTitle("Stadiums")
    }
}
