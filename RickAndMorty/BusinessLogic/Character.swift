//
//  Character.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 26.01.2025.
//

import Foundation
import UIKit

class Character {
    let id: Int?
    let name: String?
    let status: String?
    let gender: String?
    let species: String?
    let origin: String?
    let created: String?
    let location: String?
    let imageURL: String?
    
    init() {
        id = 0
        name = ""
        status = ""
        gender = ""
        species = ""
        origin = ""
        created = ""
        location = ""
        imageURL = ""
    }
    
    init(id: Int, name: String, status: String, gender: String, species: String, origin: String, created: String, location: String, imageURL: String) {
        self.id = id
        self.name = name
        self.status = status
        self.gender = gender
        self.species = species
        self.origin = origin
        self.created = created
        self.location = location
        self.imageURL = imageURL
    }
}
