//
//  CarDetailView.swift
//  VBexamen
//
//  Created by Miro Six on 18/12/2025.
//

import SwiftUI

struct CarDetailView: View {
    let selectedCar: Car
    var body: some View {
        VStack(alignment: .center) {
            Text(selectedCar.brand)
            Text(selectedCar.model)
            Text("\(selectedCar.year)")
            Text("\(Int(selectedCar.price))")
            Text(selectedCar.color)
            Text(selectedCar.fuelType)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
        .navigationTitle("Detail")
    }
}
