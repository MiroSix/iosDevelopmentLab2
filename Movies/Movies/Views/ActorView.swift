//
//  ActorView.swift
//  Movies
//
//  Created by Miro Six on 02/12/2025.
//

import SwiftUI

struct ActorView: View {
    var actor : Actor?
    @Environment(MovieDataStore.self) var store
    var body: some View {
        VStack (alignment: .leading) {
            if let actor = actor {
                VStack {
                    Text("Actor: " + actor.firstName + " " + actor.lastName).bold()
                    
                    Divider()
                    Text("Birthday: " + actor.birthday)
                    Divider()
                    
                    Text("Movie(s)").bold()
                    ForEach(store.getMovies(actor: actor), id: \.self) { movie in
                        NavigationLink("\(movie.title) ", value: Route.movie(movie))
                    }
                    
                    Divider()
                    
                    NavigationStackView()
                }
            }
        }
    }
}
