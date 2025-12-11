//
//  Untitled.swift
//  Galleries
//
//  Created by Miro Six on 09/12/2025.
//

import Foundation

@Observable
class GalleryDataStore {
    private var galleries = Galleries()
    
    init(){
        
    }
    
    func getGalleries() -> [Gallery] {
        return galleries.galleries
    }
    
    func getAllArtistsInGallery(gallery: Gallery) -> [Artist] {
        if let stored = galleries.galleries.first(where: { $0.id == gallery.id }) {
            return stored.artists
        }
        return gallery.artists
    }
    
    private func sort() {
        galleries.galleries.sort { lhs, rhs in
            lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
        }
    }
    
    func loadData() async {
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(1))
            galleries = load("galleries.json")
            sort()
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
        }
    }
}
