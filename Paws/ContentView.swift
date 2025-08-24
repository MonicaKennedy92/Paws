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
    var body: some View {
        NavigationStack {
            ScrollView {
                EmptyView()
            }
            .overlay {
                if pets.isEmpty {
                    EmptyContentView(title: "No Pets", icon: "dog.circle", description: "Add a new pet to get started")
                }
            }
        }
    }
}

#Preview("No Data") {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}
