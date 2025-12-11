//
//  ContentView.swift
//  Galleries
//
//  Created by Miro Six on 09/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedGallery: Gallery? = nil
    @Environment(GalleryDataStore.self) var store
    @State var loading = true
    var body: some View {
        TabView {
            Tab("Galleries", systemImage: "photo.fill") {
                if loading == true {
                    ProgressView()
                }
                else {
                    List(store.getGalleries(), id: \.self, selection: $selectedGallery) { gallery in
                        VStack(alignment: .center) {
                            Text(gallery.name).bold()
                                .foregroundStyle(.tint)
                            
                            Text(gallery.location)

                            Text(gallery.description)
                                .foregroundColor(.gray)
                                .lineLimit(1)
                        }
                        .padding(10)
                    }
                }
            }
            Tab("\(selectedGallery?.name ?? "No Gallery")", systemImage: "photo.fill") {
                GalleryView(selectedGallery: $selectedGallery)
            }
        }.task {
            await store.loadData()
            loading = false
        }
    }
}
