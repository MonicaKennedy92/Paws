//
//  ContentView.swift
//  Paws
//
//  Created by Monica Kennedy on 2025-08-23.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext)  var context
    @Query private var pets: [Pet]
    
    let layout = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120))
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    GridRow {
                        ForEach(pets) { pet in
                            NavigationLink(destination: EmptyView()) {
                                VStack {
                                    Spacer()
                                    
                                    if let imageData = pet.photo {
                                        if let image = UIImage(data: imageData) {
                                            Image(uiImage: image)
                                        }
                                        
                                    } else {
                                        Image(systemName: "pawprint.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(40)
                                            .foregroundStyle(.quaternary)
                                    }
                                    Text(pet.name)
                                        .font(.title.weight(.light))
                                        .padding(.vertical)
                                    Spacer()
                                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity)
                                    .background(.ultraThickMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                            }.foregroundStyle(.primary)
                            
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(pets.isEmpty ? "" : "Paws")
            .overlay {
                if pets.isEmpty {
                    EmptyContentView(title: "No Pets", icon: "dog.circle", description: "Add a new pet to get started")
                }
            }
        }
    }
}

#Preview("Sample Data") {
    ContentView()
        .modelContainer(Pet.preview)
}

#Preview("No Data") {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}
