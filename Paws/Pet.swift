//
//  Pet.swift
//  Paws
//
//  Created by Monica Kennedy on 2025-08-23.
//

import Foundation
import SwiftData


@Model
final class Pet {
    var name: String
    @Attribute(.externalStorage) var photo: Data?
    
    init(name: String, photo: Data? = nil) {
        self.name = name
        self.photo = photo
    }
}


extension Pet {
    @MainActor
    static var preview: ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Pet.self, configurations: configuration)
        container.mainContext.insert(Pet(name: "Roxy"))
        container.mainContext.insert(Pet(name: "Ozzy"))
        container.mainContext.insert(Pet(name: "Bailey"))
        container.mainContext.insert(Pet(name: "Yoshi"))
        container.mainContext.insert(Pet(name: "Joey"))
        container.mainContext.insert(Pet(name: "Bella"))
        return container
    }
}
