//
//  WKResultsDataStore.swift
//  WKQatar
//
//  Created by Miro Six on 20/10/2025.
//

import Foundation

@Observable
class WKResultsDataStore {
    var results : [WKResult]
    
    init() {
        results = load("WKResultsQatar.json")
    }
    
    func getAllLocations() -> [String] {
        var array: [String] = []
        
        for result in results {
            if !array.contains(result.location) {
                array.append(result.location)
            }
        }
        return array
    }
    
    func getAllResultsByLocation(location: String) -> [WKResult] {
        var result: [WKResult] = []
        
        
        
        return result
    }
    
    func getAllTeams() -> [String] {
        var array: [String] = []
        
        for result in results {
            if !array.contains(result.awayTeam) {
                array.append(result.awayTeam)
            }
            if !array.contains(result.homeTeam) {
                array.append(result.homeTeam)
            }
        }
        
        return array
    }
}
