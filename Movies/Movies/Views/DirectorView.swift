//
//  DirectorView.swift
//  Movies
//
//  Created by Miro Six on 02/12/2025.
//

import SwiftUI

struct DirectorView: View {
    var director : Director?
    @Environment(MovieDataStore.self) var store
    var body: some View {
        if let director = director {
            VStack {
                Text("Director: " + director.firstName + " " + director.lastName).bold()
                
                Divider()
                
                Text("Movie(s)").bold()
                ForEach(store.getMovies(director: director), id: \.self) { movie in
                    NavigationLink("\(movie.title) ", value: Route.movie(movie))
                }
                
                Divider()
                
                Text("Actors work with:")
                ForEach(store.getActors(director: director), id: \.self) { actor in
                    NavigationLink("\(actor.firstName) ", value: Route.actor(actor))
                }
                
                Divider()
                NavigationStackView()
            }
        }
    }
}
