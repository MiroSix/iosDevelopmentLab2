//
//  GalleriesApp.swift
//  Galleries
//
//  Created by Miro Six on 09/12/2025.
//

import SwiftUI

@main
struct GalleriesApp: App {
    let store = GalleryDataStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(store)
        }
    }
}
