//
//  WelcomeView.swift
//  WKQatar
//
//  Created by Miro Six on 20/10/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State var SelectedTeam: String? = nil
    var body: some View {
        List(getAllTeams()){
            
        }
        NavigationLink(titleKey: "Results"){
            ResultsView()
        }
    }
}
