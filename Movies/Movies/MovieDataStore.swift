//
//  MovieDataStore.swift
//  Movies
//
//  Created by Miro Six on 18/11/2025.
//

import Foundation

@Observable
class MovieDataStore {
    private var movies = Movies()
    
    init(){
        
    }
    
    func getMovies() -> [Movie] {
        return movies.movies
    }
    
    func getMovies(actor: Actor) -> [Movie] {
        var arr: [Movie] = []
        
        for movie in movies.movies {
            if movie.actors.contains(actor) && !arr.contains(where: { $0 == movie }) {
                arr.append(movie)
            }
        }
        
        return arr
    }
    
    func getMovies(director: Director) -> [Movie] {
        var arr: [Movie] = []
        
        for movie in movies.movies {
            if movie.director == director && !arr.contains(where: { $0 == movie }) {
                arr.append(movie)
            }
        }
        
        return arr
    }
    
    func getActors(director: Director) -> [Actor] {
        var arr: [Actor] = []
        let allMoviesFromDirector: [Movie] = getMovies(director: director)
        
        for movie in allMoviesFromDirector {
            for actor in movie.actors {
                arr.append(actor)
            }
        }
        
        return arr
    }
    
    private func sort() {
        movies.movies.sort { lhs, rhs in
            lhs.title.localizedStandardCompare(rhs.title) == .orderedAscending
        }
    }
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(1)) // Simulate long load
            movies = load("movies.json")
            sort()
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
            //movies is lege array
        }
    }
}
