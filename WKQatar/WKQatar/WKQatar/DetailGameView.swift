//
//  DetailGameView.swift
//  WKQatar
//
//  Created by Miro Six on 20/10/2025.
//

import SwiftUI

struct DetailGameView: View {
    @Binding var selectedWKResult: WKResult?
    var body: some View {
        ScoreDetailView(selectedWKResult: $selectedWKResult)
    }
}
