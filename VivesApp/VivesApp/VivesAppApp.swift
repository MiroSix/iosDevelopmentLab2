//
//  VivesAppApp.swift
//  VivesApp
//
//  Created by Miro Six on 03/11/2025.
//

import SwiftUI

@main
struct VivesAppApp: App {
    let store = UurroosterDataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(store)
        }
    }
}
