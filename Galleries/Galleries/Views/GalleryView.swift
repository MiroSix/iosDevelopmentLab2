//
//  GalleryView.swift
//  Galleries
//
//  Created by Miro Six on 11/12/2025.
//

import SwiftUI

struct GalleryView: View {
    @Binding var selectedGallery: Gallery?
    @State private var selectedArtist: Artist? = nil
    @Environment(GalleryDataStore.self) var store
    var body: some View {
        NavigationStack {
            if let gallery = selectedGallery {
                VStack {
                    Text(gallery.name).foregroundStyle(.tint).bold()
                    Divider().foregroundStyle(.tint)
                    Text(gallery.location)
                    Text(gallery.description).foregroundColor(.gray)
                    Divider().foregroundStyle(.tint)
                    
                    List(store.getAllArtistsInGallery(gallery: gallery), id: \.self, selection: $selectedArtist) { artist in
                        NavigationLink ("\(artist.name)") {
                            ArtistView(selectedArtist: $selectedArtist)
                        }
                    }
                }
            }
        }
    }
}
