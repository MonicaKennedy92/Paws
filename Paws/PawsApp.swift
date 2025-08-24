//
//  PawsApp.swift
//  Paws
//
//  Created by Monica Kennedy on 2025-08-23.
//

import SwiftUI
import SwiftData
@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
