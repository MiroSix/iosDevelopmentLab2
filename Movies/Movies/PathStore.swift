//
//  PathStore.swift
//  Movies
//
//  Created by Miro Six on 02/12/2025.
//

import Foundation

enum Route: Hashable {
    case movie(Movie)
    case director(Director)
    case actor(Actor)
}

@Observable
class PathStore {
    var path = [Route]()
}
