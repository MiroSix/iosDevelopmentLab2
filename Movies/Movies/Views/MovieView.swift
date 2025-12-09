//
//  MovieView.swift
//  Movies
//
//  Created by Miro Six on 02/12/2025.
//

import SwiftUI

struct MovieView: View {
    var movie: Movie?
    var body: some View {
        VStack(alignment: .leading) {
            if let movie = movie {
                VStack {
                    Text(movie.title).bold()
                    Text(movie.description)
                    Divider()

                    Text("Actors").bold()
                    ForEach(movie.actors, id: \.self) { actor in
                        NavigationLink("\(actor.firstName) ", value: Route.actor(actor))
                    }

                    Divider()

                    Text("Director").bold()
                    Text(movie.director.firstName)

                    Divider()

                    NavigationStackView()
                }
            }
        }
    }
}
