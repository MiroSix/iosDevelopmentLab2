//
//  AppState.swift
//  VBexamen
//
//  Created by Miro Six on 18/12/2025.
//

import Foundation

@Observable
class AppState {
    var selection: String = "Alle"
    var sorting = ["Alle","Benzine","Diesel","Elektrisch"]
}
