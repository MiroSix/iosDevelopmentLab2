//
//  ContentView.swift
//  VBexamen
//
//  Created by Miro Six on 16/12/2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(DataManager.self) var store
    @Environment(AppState.self) var appState
    @State private var selectedCar: Car? = nil
    @State var loading = true
    @State private var path: [Car] = []
    
    var body: some View {
        @Bindable var state = appState
        
        NavigationStack(path: $path) {
            Picker("Selection", selection: $state.selection) {
                ForEach(state.sorting, id: \.self) { sorting in
                    Text(sorting)
                }
            }
            .pickerStyle(.segmented)
            
            Grid {
                if loading == true {
                    ProgressView()
                } else {
                    List(store.getCarsBySorting(sorting: state.selection), id: \.self) { car in
                        Button {
                            path.append(car)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(car.brand + " " + car.model)
                                Text(car.color)
                            }
                        }
                    }
                }
            }
            .task {
                await store.loadCars()
                loading = false
            }
            .navigationTitle("Auto's")
            .navigationDestination(for: Car.self) { car in
                CarDetailView(selectedCar: car)
            }
        }
    }
}
