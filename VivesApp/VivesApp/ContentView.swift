//
//  ContentView.swift
//  VivesApp
//
//  Created by Miro Six on 03/11/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(UurroosterDataStore.self) private var store
    @State var loading = true
    @State var selectedLesson: EventModel? = nil

    var body: some View {
        NavigationSplitView {
            if loading {
                ProgressView()
            } else {
                List(store.uurrooster, id: \.self, selection: $selectedLesson) { lesson in
                    VStack(alignment: .leading) {
                        Text(DateUtil.formatDateTime(date: lesson.startDateTime))
                            .bold()
                        Text(lesson.title)
                    }
                }
                .toolbar {
                    NavigationLink(destination: AddEventView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        } detail: {
            if selectedLesson == nil {
                Text("Selecteer event")
            } else {
                VStack {
                    Text(selectedLesson!.title)
                        .padding(.vertical, 4)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.tint)
                        )
                        .foregroundStyle(.white)
                    Divider()
                    Text(selectedLesson!.location)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 8) {
                        GridRow {
                            Text("Start")
                            Text(DateUtil.formatDateTime(date: selectedLesson!.startDateTime))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        GridRow {
                            Text("End")
                            Text(DateUtil.formatDateTime(date: selectedLesson!.endDateTime))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .frame(maxWidth: .infinity)

                    Divider()
                    Image(systemName: "c.circle")
                    Spacer()
                }
                .padding(15)
                .frame(maxWidth: .infinity)
                .toolbar {
                    NavigationLink(destination: EditView(selectedLesson: $selectedLesson)) {
                        Image(systemName: "ellipsis")
                    }
                }
            }
        }
        .task {
            await store.loadData()
            loading = false
        }
    }
}
