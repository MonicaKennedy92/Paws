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
