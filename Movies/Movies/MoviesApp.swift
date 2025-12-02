//
//  MoviesApp.swift
//  Movies
//
//  Created by Miro Six on 18/11/2025.
//

import SwiftUI

@main
struct MoviesApp: App {
    let store = MovieDataStore()
    let pathStore = PathStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(store).environment(pathStore)
        }
    }
}
