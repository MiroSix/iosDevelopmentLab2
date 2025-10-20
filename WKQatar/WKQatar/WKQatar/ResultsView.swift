//
//  ResultsView.swift
//  WKQatar
//
//  Created by Miro Six on 20/10/2025.
//

import SwiftUI

struct ResultsView: View {
    var body: some View {
        NavigationSplitView {
            ListStadionView()
        } detail: {
            DetailGameView()
        }
    }
}
