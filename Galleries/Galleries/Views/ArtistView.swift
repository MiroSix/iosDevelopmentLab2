//
//  ArtistView.swift
//  Galleries
//
//  Created by Miro Six on 11/12/2025.
//

import SwiftUI

struct ArtistView: View {
    @Binding var selectedArtist: Artist?
    @State private var selectedArtwork: Artwork? = nil
    var body: some View {
        if let artist = selectedArtist {
            VStack {
                Text(artist.name)
                Divider()
                Text(artist.nationality)
                Text(artist.style)
                Text(artist.description)
                Divider()
                Text("List of art")
                List(artist.artworks, id: \.self, selection: $selectedArtwork) { artwork in
                    NavigationLink ("\(artwork.title)") {
                        ArtworkView(selectedArtwork: $selectedArtwork, artist: artist)
                    }
                }
            }
        }
    }
}
