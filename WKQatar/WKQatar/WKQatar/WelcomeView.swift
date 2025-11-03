//
//  WelcomeView.swift
//  WKQatar
//
//  Created by Miro Six on 20/10/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State var selectedTeam: String? = nil
    @Environment(WKResultsDataStore.self) private var store
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "soccerball").foregroundStyle(.tint)
                Text("WK QATAR 2020")
                    .font(.title)
                    .fontWeight(.semibold)
                Image(systemName: "soccerball").foregroundStyle(.tint)
            }
            Text("Select your favorite team...")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)

            List(store.getAllTeams(), id: \.self, selection: $selectedTeam){ team in
                Text(team)
            }
            NavigationLink("Next"){
                ResultsView(selectedTeam: $selectedTeam)
            }
        }
        .padding()
    }
    
}
