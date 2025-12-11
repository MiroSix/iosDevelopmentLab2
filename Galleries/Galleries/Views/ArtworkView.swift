//
//  ArtworkView.swift
//  Galleries
//
//  Created by Miro Six on 11/12/2025.
//

import SwiftUI

struct ArtworkView: View {
    @Binding var selectedArtwork: Artwork?
    var artist: Artist
    var body: some View {
        if let artwork = selectedArtwork {
            VStack {
                Text(artwork.title)
                Divider()
                Text(artwork.medium)
                Text(artwork.dimensions)
                Text(artwork.description)
                Divider()
                Text("Artist: " + artist.name)
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
