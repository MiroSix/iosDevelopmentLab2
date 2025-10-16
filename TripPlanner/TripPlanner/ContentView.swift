//
//  ContentView.swift
//  TripPlanner
//
//  Created by Miro Six on 02/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            DepartureView()
                .tabItem {
                    Label("Departure", systemImage: "airplane.departure")
                }
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info")
                }
            ReturnView()
                .tabItem {
                    Label("Return", systemImage: "airplane.arrival")
                }
        }
    }
}

#Preview {
    ContentView()
}
