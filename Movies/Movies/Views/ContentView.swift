//
//  ContentView.swift
//  Movies
//
//  Created by Miro Six on 18/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State var loading = true
    @State var selectedMovie: String? = nil
    @Environment(MovieDataStore.self) var store
    @Environment(PathStore.self) var pathStore
    var body: some View {
        @Bindable var pathStore = pathStore
        NavigationStack(path: $pathStore.path) {
            if loading == true {
                ProgressView()
            }
            else{
                List (store.getMovies(), id: \.self, selection: $selectedMovie) { movie in
                    NavigationLink(value: Route.movie(movie)) {
                        VStack (alignment: .leading) {
                            Text(movie.title).bold()
                            Text(movie.description)
                        }
                    }
                }.navigationTitle("Movies")
                .navigationDestination(for: Route.self) { route in
                    switch route {
                        
                    case let .movie(movie: movie):
                        MovieView(movie: movie)
                        
                    case let .director(director: director):
                        DirectorView(director: director)
                        
                    case let .actor(actor: actor):
                        ActorView(actor: actor)
                    }
                }
            }
        }
        .task {
            await store.loadData()
            loading = false
        }
    }
}
