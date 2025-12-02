//
//  Movie.swift
//  Movies
//
//  Created by Miro Six on 18/11/2025.
//

import Foundation

struct Movie: Codable, Hashable {
    var title: String
    var description: String
    var actors: [Actor]
    var director: Director
    var releaseDate: String
}
