//
//  NavigationStackView.swift
//  Movies
//
//  Created by Miro Six on 04/12/2025.
//

import SwiftUI

struct NavigationStackView: View {
    @Environment(PathStore.self) var pathStore

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Overview navigationStack").bold()
            ForEach(Array(pathStore.path.enumerated()), id: \.offset) { index, pathElement in
                switch pathElement {
                case let .actor(actor):
                    Button("\(actor.firstName) \(actor.lastName)") {
                        pathStore.path = Array(pathStore.path.prefix(index + 1))
                    }
                case let .director(director):
                    Button("\(director.firstName) \(director.lastName)") {
                        pathStore.path = Array(pathStore.path.prefix(index + 1))
                    }
                case let .movie(movie):
                    Button("\(movie.title)") {
                        pathStore.path = Array(pathStore.path.prefix(index + 1))
                    }
                }
            }

            Button("Clear") {
                pathStore.path = []
            }
        }
    }
}
