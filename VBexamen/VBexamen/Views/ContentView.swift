//
//  ContentView.swift
//  VBexamen
//
//  Created by Miro Six on 18/12/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "car.fill") {
                HomeView()
            }
            Tab("Favorieten", systemImage: "heart.fill") {
                FavoritesView()
            }
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
    }
}
