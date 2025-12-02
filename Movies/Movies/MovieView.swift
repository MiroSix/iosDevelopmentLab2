//
//  MovieView.swift
//  Movies
//
//  Created by Miro Six on 02/12/2025.
//

import SwiftUI

struct MovieView: View {
    @Binding var movie : Movie?
    @Binding var pathStore : PathStore
    var body: some View {
        VStack (alignment: .leading) {
            if let movie = movie {
                Text(movie.title).bold()
                Text(movie.description)
            }
        }
    }
}

