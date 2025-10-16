//
//  ReturnView.swift
//  TripPlanner
//
//  Created by Miro Six on 02/10/2025.
//

import SwiftUI

struct ReturnView: View {
    var body: some View {
        VStack {
            // Vertrek en destination gui
            HStack {
                VStack {
                    Text("BCN").foregroundStyle(.accent).font(Font.largeTitle.bold())
                    Text("Barcelona")
                    Text("13:05")
                }
                
                Image(systemName: "airplane").imageScale(.large)
                
                VStack {
                    Text("BRU").foregroundStyle(.accent).font(Font.largeTitle.bold())
                    Text("Brussels")
                    Text("15:15")
                }
            }
            
            //Flight specific info
            Grid {
                Divider().overlay(.tint).padding(0)
                GridRow {
                    Text("flight")
                    Text("gate")
                    Text("seat")
                }
                .padding(.top, 10)
                .padding(.bottom, 0)
                GridRow {
                    Text("SN205s")
                    Text("B23")
                    Text("27A")
                }.bold()
                .padding(.top, 0)
                .padding(.bottom, 10)
                Divider().overlay(.tint).padding(0)
            }
            .background(.tint, in: RoundedRectangle(cornerRadius: 8)).foregroundStyle(.white)
            Spacer()
            
            //Passenger overview
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("Passenger").foregroundStyle(.gray)
                    Text("Miro Six")
                    
                    Text("Class").foregroundStyle(.gray)
                    Text("Business")
                    
                    Text("Flight date").foregroundStyle(.gray)
                    Text("27/08/2026")
                    Spacer()
                }
                Spacer()
                Image(systemName: "person.crop.artframe").imageScale(.large)
                Spacer()
            }
            Spacer()
        
        }
        .padding()
        
    }
}

#Preview {
    ReturnView()
}
