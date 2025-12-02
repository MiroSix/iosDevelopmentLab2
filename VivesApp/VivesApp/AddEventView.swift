//
//  AddEventView.swift
//  VivesApp
//
//  Created by Miro Six on 06/11/2025.
//

import SwiftUI

struct AddEventView: View {
    @State private var title: String = ""
    @State private var location: String = ""
    @State private var isAllDay: Bool = false
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var eventType: String = ""
    
    var body: some View {
        Text("ADD EVENT")
        Form {
            TextField("Title?", text: $title)
            TextField("Location?", text: $location)
            
            Toggle("All day?", isOn: $isAllDay)
            
            DatePicker("Start date & time?", selection: $startDate, displayedComponents: isAllDay ? [.date] : [.date, .hourAndMinute])
            
            DatePicker("End date & time?", selection: $endDate, displayedComponents: isAllDay ? [.date] : [.date, .hourAndMinute])
            
            HStack {
                Picker("Type", selection: $eventType) {
                    Text("Academic")
                    Text("Course")
                }
                .pickerStyle(.segmented)
                .frame(width: 200)
            }
            
            HStack {
                Spacer()
                Button("SAVE") {
                    saveEvent()
                }
                .buttonStyle(.borderedProminent)
                
                Button("CANCEL") {
                    cancelEvent()
                }
                .buttonStyle(.bordered)
                Spacer()
            }
        }
        .padding()
    }
    
    func saveEvent() {
        //voeg hier logica toe om het event op te slaan
        print("Saved: \(title), \(startDate.formatted(date: .abbreviated, time: .shortened))")
    }
    
    func cancelEvent() {
        //moet ook nog kunnen cancellen
    }
}
