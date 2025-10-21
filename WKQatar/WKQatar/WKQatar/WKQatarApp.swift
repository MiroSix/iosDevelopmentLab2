//
//  WKQatarApp.swift
//  WKQatar
//
//  Created by Miro Six on 20/10/2025.
//

import SwiftUI

@main
struct WKQatarApp: App {
    let store = WKResultsDataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(store)
        }
    }
}
