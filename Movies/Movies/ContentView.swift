//
//  ContentView.swift
//  Movies
//
//  Created by Miro Six on 18/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State var movie: Movie? = nil
    @State var director: Director? = nil
    @State var actor: Actor? = nil
    @State var loading = true
    @Environment(MovieDataStore.self) var store
    @State private var pathStore = PathStore()
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            if loading == true {
                ProgressView()
            }
            else{
                List (store.getMovies(), id: \.self, selection: $movie) { movie in
                    NavigationLink(value: Route.movie(movie)) {
                        VStack (alignment: .leading) {
                            Text(movie.title).bold()
                            Text(movie.description)
                        }
                    }
                }.navigationTitle("Movies")
            }
        }
        .navigationDestination(for: Route.self) { route in
            switch route {
                
            case let .movie(movie: movie):
                MovieView(movie: $movie, pathStore: $pathStore)
                
            case let .director(director: director):
                DirectorView(director: $director, pathStore: $pathStore)
                
            case let .actor(actor: actor):
                ActorView(actor: $actor, pathStore: $pathStore)
            }
        }
        .task {
            await store.loadData()
            loading = false
        }
    }
}
