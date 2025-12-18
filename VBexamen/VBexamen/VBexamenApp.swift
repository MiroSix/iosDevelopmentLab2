//
//  VBexamenApp.swift
//  VBexamen
//
//  Created by Miro Six on 16/12/2025.
//

import SwiftUI

@main
struct VBexamenApp: App {
    let store = DataManager()
    @State var appState = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(store).environment(appState)
        }
    }
}
